# # load packages that are useful for phylogenetic analysis/manipulation
library("ape")
library("phytools")
library("geiger")

# reading in a tree file
tree <- "data/rbcL.raxml.bestTree.tre"
br <- read.newick(tree)
#tree1<-reroot(tree1,90)
plot(br)

# file with multiple trees - bootstrap replicates
BStrees <- "data/rbcL.raxml.bootstraps.tre"
bo <- read.newick(BStrees)

# calculate consensus
# p=0.5 is majority rule, p=1 is strict
cons <- consensus(bo, p = 0.5, check.labels = TRUE, rooted = FALSE)
plot(cons)
# this however does not give us the numbers

# for rooting the tree it can be useful to know which edges have which numbers
plot(br, cex=0.4)
edgelabels(cex=0.4)
# in the case of the rbcL tree we want to root on edge number 2

# putting bootstrap numbers as labels on edges
# the default looks ugly (green boxes with numbers on branches)
boot <- prop.clades(br, bo)
plot(br, cex=0.5)
drawSupportOnEdges(boot, frame = "none", adj = c(1,-1), cex=0.4)
