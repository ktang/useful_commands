cd /Users/tang58/Software/R
R CMD INSTALL pkg_0.1.tar.gz 
##########
# read excel
###########
#The xlsx package has the function read.xlsx() for reading Excel files. This will read
#the first sheet of an Excel spreadsheet:
# Only need to install once
install.packages("xlsx")
library(xlsx)
data <- read.xlsx("datafile.xlsx", 1)

#For reading older Excel files in the .xls format, the gdata package has the function
#read.xls():
# Only need to install once
install.packages("gdata")
library(gdata)
# Read first sheet
data <- read.xls("datafile.xls")
##########################

setwd("/Users/tang58/misc/Kai_academia/ROS1_targets/C24_background/DMR/downstream_for_heatmap")

x = read.delim("filtered_ROS1_c24_hyperDMRs_with_meth_level_in_nrpd1a_and_ros1-1nrpd1a.txt")
library(heatmap.plus)
library(RColorBrewer)
cols = brewer.pal(9,"Blues")
start = 12
CG = x[,c(start, start + 4 , start +24 , start+36)]
CG = as.matrix(CG)
CG = na.omit(CG)
heatmap(CG, Colv=NA, col= cols)

library(gplots)
heatmap.2(all, Colv=NA, col=cols, trace = "none")

all = ago6[,c( 15, 19, 47, 59,12, 16, 44, 56,  13,17,45,57,  14,18,46,58 )]
all = as.matrix(all)
heatmap.2(all, Colv=NA, col=cols, trace = "none")

all = double[,c( 15, 19, 47, 59,12, 16, 44, 56,  13,17,45,57,  14,18,46,58 )]
all = as.matrix(all)
heatmap.2(all, Colv=NA, col=cols, trace = "none")

#################################################
# boxplot
######################
width_val = 3.8; height_val = 3.5; units_val = "in"; res_val = 100; pointsize_val =8; 

file_name = paste("edm2_rdd_overlape_part_fig_w", height_val, "_h", height_val, "_res", res_val, "_pt", pointsize_val, ".png", sep="")
png(file_name, width = width_val, height = height_val, units = units_val , res = res_val, pointsize = pointsize_val );

#par(mar=c(1,3,1,1)+0.1)

par(mar= rep(0.5, 4))

par(oma = c(4, 3.5, 0, 0) )

outline_val = F
range_val   = 0
xaxt_val    = "n"
ylim_val    = c(0,100)
axes_val    = F
at_trick    = seq(0,100,20)
labels_val  = c(0, rep("",4) ,100)
labels_val2 = F
side_val    = 2;
lwd_axis_val = 1;

las_val     = 1;

cex_axis_val  = 2; #1.3 OK

num = 4;
layoutmat =  matrix(1:9,ncol = 3) ;
layout(layoutmat)
boxplot(x[,"wt_CG_per"] ,x[,"sk460A_edm2_CG_per"],x[,"ibm1.4_CG_per"], x[,"rdd_CG_per"], outline = outline_val, range = range_val, xaxt = xaxt_val, ylim = ylim_val, col = cols_db[1:num], axes = axes_val ); 
axis(side = side_val, at = at_trick, labels = labels_val, lwd = lwd_axis_val, cex.axis = cex_axis_val , las = las_val ); box();




###############
capabilities()		# Report on the optional features which have been compiled into this build of R

search()			# Gives a list of attached packages (see library), and R objects, usually data.frames.

loadedNamespaces()	# Functions to load and unload name spaces.

vignette()			# View a specified vignette, or list the available ones.

install.packages()	# Download and install packages from CRAN-like repositories or from local files.

methods()			# List all available methods for an S3 generic function, or all methods for a class.


###########
# Biostrings
###############
# matchin methods
matchPattern
matchLRPattern
matchPDict
