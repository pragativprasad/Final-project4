Final_project_config_default.html: code/render_report.R \
  Final_project.Rmd descriptive_analysis 
	Rscript code/render_report.R

output/merged_data.rds: code/Data_prepare.R data/Flurosis2.csv	
	Rscript code/Data_prepare.R

output/Table1.rds: code/Table_descriptive.R output/merged_data.rds
	Rscript code/Table_descriptive.R
	
output/boxplot.png: code/Box_plot.R output/merged_data.rds
	Rscript code/Box_plot.R
	
.PHONY: descriptive_analysis
descriptive_analysis: output/Table1.rds output/boxplot.png	
	
	
.PHONY: clean
clean:
	rm -f output/*.rds && rm -f output/*.png && rm -f *html
	
	