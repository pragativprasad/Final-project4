here::i_am("code/Box_plot.R")

data <- readRDS(
  file=here::here("output/merged_data.rds")
)
library(ggplot2)
boxplot<- ggplot(data, aes( x=UCI_flurosis2, y= Age, fill= Gender)) +
  geom_boxplot()+
  coord_flip() +
  stat_boxplot(geom = "errorbar") +
  theme_classic()+
  labs( title = "BOX PLOT", x= "Upper molar incisor flurosis", y= "Age in years",
        subtitle = "Table1: Basic Boxplot showing age distribution for  Upper molar incisor flurosis stratified by gender in US" )+
  theme_bw()+
  theme(axis.title.x  = element_text(size=16), axis.title = element_text(size = 16),
        plot.title = element_text(size=20,  hjust=0.5), plot.subtitle = element_text(size=10))


ggsave(
  here::here("output/boxplot.png"),
  plot = boxplot,
  device="png"
)
