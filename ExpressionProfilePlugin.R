### R code from vignette source 'GOexpress-UsersGuide.Rnw'

###################################################
### code chunk number 5: GOexpress-UsersGuide.Rnw:201-203
###################################################
library(GOexpress) # load the GOexpress package
set.seed(4543) # set random seed for reproducibility

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")

input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
    pfix = prefix()
  if (length(pfix) != 0) {
     pfix <<- paste(pfix, "/", sep="")
  }
}

run <- function() {}

output <- function(outputfile) {

AlvMac <- readRDS(paste(pfix, parameters["dataset", 2], sep="/"))
AlvMac_results <- readRDS(paste(pfix, parameters["results", 2], sep="/"))
geneid <- parameters["geneid", 2]
xvar <- parameters["xvar", 2]

pdf(outputfile)


AlvMac$Animal.Treatment <- paste(AlvMac$Animal, AlvMac$Treatment, sep="_")
expression_profiles(
    gene_id = geneid, result = AlvMac_results,
    eSet=AlvMac, x_var = xvar, line.size=1,
    seriesF="Animal.Treatment", linetypeF="Animal",
    legend.title.size=10, legend.text.size=10,
    legend.key.size=15)

}
