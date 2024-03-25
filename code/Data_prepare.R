here::i_am("code/Data_prepare.R")
absolute_path_to_data <- here::here("data", "Flurosis2.csv")
data <- read.csv(absolute_path_to_data, header=TRUE)

library(labelled)
library(gtsummary)

var_label(data) <- list(
  UCI_flurosis2 = "Upper central incisor flurosis"
)
data$Age_Yr <- ifelse(data$Age <12, "<12", ">=12")
data |>
  select("UCI_flurosis2","Gender", "Age_Yr") |>
  tbl_summary(by= UCI_flurosis2)|>
  modify_spanning_header(c("stat_1", "stat_2", "stat_3", "stat_4", "stat_5", "stat_6", "stat_7")~ "**Upper molar incisor flurosis**") |>
  add_overall()
saveRDS(
  data,file= here::here("output/merged_data.rds")
)