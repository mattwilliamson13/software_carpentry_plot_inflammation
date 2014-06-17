# Author: Naupaka Zimmerman June 16, 2014
# Script to make figure with ggplot from
# command line argument for SWC bootcamp
# UC Davis - Davis, CA
 
.libPaths("C:/Users/mwilliam/Documents/R/win-library/3.1")
 
# Load libraries
require(ggplot2)
require(reshape2)
 
# Takes one command line argument as input data set
options <- commandArgs(trailingOnly = TRUE)
 
# load that csv from command line arg
data.in <- read.csv(options[1])
 
# melt with defaults
data.in.melted <- melt(data.in)
 
#create a plot with ggplot
 out.plot <- ggplot(data.in.melted,(aes(x=PatientID, y=value))) +
geom_point() +
stat_sum() +
theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
ggtitle(paste("File: ", options[1])) #options1 contains filename based on beginning of code
# save pdf based on input file name
savename <- paste0(options[1],".pdf")
ggsave(out.plot, file=savename, width = 12, height = 8)


