# R/data_prep.R
# NHANES 2013–2014 data prep
# Keeps YOUR variables: BMDBMIC, DIQ240, + demographics

# ---- Load libraries ----
library(tidyverse)
library(nhanesA)

# ---- Download NHANES 2013–2014 files ----
bmx_h  <- nhanes("BMX_H")   # Body Measures
demo_h <- nhanes("DEMO_H")  # Demographics
diq_h  <- nhanes("DIQ_H")   # Diabetes Questionnaire

# ---- Sanity checks ----
stopifnot(all(c("SEQN","BMDBMIC") %in% names(bmx_h)))
stopifnot(all(c("SEQN","RIDAGEYR","RIAGENDR","RIDRETH1",
                "SDMVPSU","SDMVSTRA","WTMEC2YR") %in% names(demo_h)))
stopifnot(all(c("SEQN","DIQ240") %in% names(diq_h)))

# ---- Subset to your variables ----
exam_sub <- bmx_h  %>% select(SEQN, BMDBMIC)
demo_sub <- demo_h %>% select(SEQN, RIDAGEYR, RIAGENDR, RIDRETH1,
                              SDMVPSU, SDMVSTRA, WTMEC2YR)
diq_sub  <- diq_h  %>% select(SEQN, DIQ240)

# ---- Merge into one dataset ----
merged_data <- exam_sub %>%
  left_join(demo_sub, by = "SEQN") %>%
  left_join(diq_sub,  by = "SEQN")

# ---- Quick checks ----
print(glimpse(merged_data))
print(table(merged_data$BMDBMIC, useNA = "ifany"))
print(table(merged_data$DIQ240,  useNA = "ifany"))

# ---- Save to file for reuse ----
dir.create("data", showWarnings = FALSE)
saveRDS(merged_data, "data/merged_2013_2014.rds")
message("Saved: data/merged_2013_2014.rds")
