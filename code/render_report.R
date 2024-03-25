here:: i_am("code/render_report.R")

WHICH_CONFIG<- Sys.getenv("WHICH_CONFIG")
config_list<- config::get(
  config = WHICH_CONFIG
)

library(rmarkdown)
report_filename <- paste0( 
  "Final_project_config_", 
  WHICH_CONFIG,
  ".html"
)
# rendering a report in production mode
render("Final_project.Rmd", output_file = report_filename)