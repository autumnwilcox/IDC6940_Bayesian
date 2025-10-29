# R/data_prep.R — NHANES 2013–2014 (H) with DIQ010
# Purpose: Import, validate, coerce, and save a merged dataset for downstream analysis.

suppressPackageStartupMessages({
  library(tidyverse)
  library(nhanesA)
})

set.seed(1234)

# ---- Helper: robust coercion for labelled / text fields to numeric ----
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

# ---- Main builder (returns merged_data and saves RDS) ----
build_nhanes_h <- function(save_path = "data/merged_2013_2014.rds", verbose = TRUE) {
  if (verbose) message("Downloading NHANES 2013–2014 (H) tables via nhanesA...")
  
  # 1) Download source tables
  bmx_h  <- try(nhanes("BMX_H"),  silent = TRUE)
  demo_h <- try(nhanes("DEMO_H"), silent = TRUE)
  diq_h  <- try(nhanes("DIQ_H"),  silent = TRUE)
  
  if (inherits(bmx_h, "try-error") || inherits(demo_h, "try-error") || inherits(diq_h, "try-error")) {
    stop("Failed to download one or more NHANES tables (BMX_H/DEMO_H/DIQ_H). Check internet or nhanesA.")
  }
  
  # 2) Hard checks for required columns
  need_demo <- c("SEQN","RIDAGEYR","RIAGENDR","RIDRETH1","SDMVPSU","SDMVSTRA","WTMEC2YR")
  if (!all(c("SEQN","BMXBMI") %in% names(bmx_h))) {
    stop("BMX_H missing required columns: SEQN and/or BMXBMI.")
  }
  if (!all(need_demo %in% names(demo_h))) {
    missing <- setdiff(need_demo, names(demo_h))
    stop("DEMO_H missing required columns: ", paste(missing, collapse = ", "))
  }
  if (!("DIQ010" %in% names(diq_h))) {
    stop("DIQ010 is not in DIQ_H. Verify cycle 'DIQ_H' and nhanesA version.")
  }
  
  # 3) Select only needed variables
  exam_sub <- bmx_h  %>% select(SEQN, BMXBMI)
  demo_sub <- demo_h %>% select(all_of(need_demo))
  diq_sub  <- diq_h  %>% select(SEQN, DIQ010, dplyr::any_of("DIQ050"))
  
  # 4) Merge (DEMO base -> add EXAM -> add DIQ)
  merged_data <- demo_sub %>%
    left_join(exam_sub, by = "SEQN") %>%
    left_join(diq_sub,  by = "SEQN")
  
  # 5) Coercions (ensure numeric types for analysis)
  #    Keep a diagnostic copy of raw DIQ010 in case coercion fails
  diag_DIQ010 <- merged_data$DIQ010
  
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
  
  # 6) Validations
  req_cols <- c("SEQN","DIQ010","BMXBMI","RIDAGEYR","RIAGENDR","RIDRETH1","SDMVPSU","SDMVSTRA","WTMEC2YR")
  if (!all(req_cols %in% names(merged_data))) {
    stop("Merged data missing columns: ", paste(setdiff(req_cols, names(merged_data)), collapse = ", "))
  }
  if (nrow(merged_data) == 0) stop("Merged data has zero rows.")
  if (sum(merged_data$DIQ010 %in% c(1,2), na.rm = TRUE) == 0) {
    # Give a helpful peek at raw values if coercion failed
    bad_vals <- utils::head(unique(as.character(diag_DIQ010)), 10)
    stop("DIQ010 has no 1/2 values after coercion. Example raw DIQ010 values: ",
         paste(bad_vals, collapse = ", "),
         ". Inspect DIQ_H and the coercion rules in to_num().")
  }
  
  # 7) Save
  dir.create(dirname(save_path), showWarnings = FALSE, recursive = TRUE)
  saveRDS(merged_data, save_path)
  if (verbose) message("Saved: ", save_path)
  
  invisible(merged_data)
}

# ---- Run builder when sourced (safe offline mode) ----
suppressPackageStartupMessages(library(curl))

if (curl::has_internet()) {
  # Online: rebuild dataset from NHANES API
  message("Internet connection detected: downloading NHANES 2013–2014 (H) tables...")
  merged_data <- build_nhanes_h()
} else {
  # Offline fallback
  message("Offline mode: loading previously saved dataset...")
  local_path <- "data/merged_2013_2014.rds"
  if (file.exists(local_path)) {
    merged_data <- readRDS(local_path)
    message("Loaded local copy from: ", local_path)
  } else {
    stop("Offline and no local file found at ", local_path,
         ". Please connect to the internet once to build and save it.")
  }
}
