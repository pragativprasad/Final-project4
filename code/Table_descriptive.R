here::i_am("code/Table_descriptive.R")

data <- readRDS(
  file=here::here("output/merged_data.rds")
)
library(labelled)
library(gtsummary)

Table1 <-  data |>
  select("UCI_flurosis2","Gender", "Age_Yr") |>
  tbl_summary(by= UCI_flurosis2)|>
  modify_spanning_header(c("stat_1", "stat_2", "stat_3", "stat_4", "stat_5", "stat_6", "stat_7")~ "**Upper molar incisor flurosis**") |>
  add_overall()

saveRDS(Table1, file= here::here("output/Table1.rds"))