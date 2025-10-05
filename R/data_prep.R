# R/data_prep.R — NHANES 2013–2014 (H) with DIQ010

library(tidyverse)
library(nhanesA)

# ---- Download source tables ----
bmx_h  <- nhanes("BMX_H")   # Body Measures (MEC)
demo_h <- nhanes("DEMO_H")  # Demographics
diq_h  <- nhanes("DIQ_H")   # Diabetes Questionnaire (Interview)

# ---- Hard checks for required columns ----
need_demo <- c("SEQN","RIDAGEYR","RIAGENDR","RIDRETH1","SDMVPSU","SDMVSTRA","WTMEC2YR")
stopifnot(all(c("SEQN","BMXBMI") %in% names(bmx_h)))
stopifnot(all(need_demo %in% names(demo_h)))
if (!("DIQ010" %in% names(diq_h))) {
  stop("DIQ010 is not in DIQ_H. Check the cycle name 'DIQ_H' and nhanesA version.")
}

# ---- Select only needed variables ----
exam_sub <- bmx_h  %>% select(SEQN, BMXBMI)
demo_sub <- demo_h %>% select(all_of(need_demo))
diq_sub  <- diq_h  %>% select(SEQN, DIQ010, dplyr::any_of("DIQ050"))

# ---- Merge (start from DEMO to keep full sample, then add exam & interview) ----
merged_data <- demo_sub %>%
  left_join(exam_sub, by = "SEQN") %>%
  left_join(diq_sub,  by = "SEQN")

# ---- Coercion helpers (handle labelled/character) ----
to_num <- function(x) {
  if (is.numeric(x)) return(x)
  xc <- as.character(x)
  n <- suppressWarnings(readr::parse_number(xc))
  if (mean(is.na(n)) > 0.80) {
    xlow <- tolower(trimws(xc))
    n <- dplyr::case_when(
      xlow %in% c("1","yes","yes, told") ~ 1,
      xlow %in% c("2","no","no, not told") ~ 2,
      xlow %in% c("3","borderline") ~ 3,
      xlow %in% c("7","refused") ~ 7,
      xlow %in% c("9","don't know","dont know","unknown") ~ 9,
      TRUE ~ NA_real_
    )
  }
  as.numeric(n)
}

merged_data <- merged_data %>%
  mutate(
    DIQ010   = to_num(DIQ010),
    DIQ050   = to_num(if (!"DIQ050" %in% names(.)) NA_real_ else DIQ050),
    BMXBMI   = suppressWarnings(as.numeric(BMXBMI)),
    RIDAGEYR = suppressWarnings(as.numeric(RIDAGEYR)),
    RIAGENDR = suppressWarnings(as.numeric(RIAGENDR)),
    RIDRETH1 = suppressWarnings(as.numeric(RIDRETH1)),
    SDMVPSU  = suppressWarnings(as.numeric(SDMVPSU)),
    SDMVSTRA = suppressWarnings(as.numeric(SDMVSTRA)),
    WTMEC2YR = suppressWarnings(as.numeric(WTMEC2YR))
  )

# ---- Diagnostics BEFORE save ----
cat("DIQ010 counts BEFORE save:\n")
print(table(merged_data$DIQ010, useNA = "ifany"))
cat("Count with DIQ010 in {1,2}:", sum(merged_data$DIQ010 %in% c(1,2), na.rm = TRUE), "\n")

# ---- Save ----
dir.create("data", showWarnings = FALSE, recursive = TRUE)
saveRDS(merged_data, "data/merged_2013_2014.rds")
message("Saved: data/merged_2013_2014.rds")
