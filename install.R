i = installed.packages()

# CRAN
if ("igraph" %in% i == FALSE){
  install.packages("igraph", repos="http://cran.r-project.org")
}
if ("data.table" %in% i == FALSE){
  install.packages("data.table", repos="http://cran.r-project.org")
}
if ("gplots" %in% i == FALSE){
  install.packages("gplots", repos="http://cran.r-project.org")
}
if ("pheatmap" %in% i == FALSE){
  install.packages("pheatmap", repos="http://cran.r-project.org")
}
if ("fitdistrplus" %in% i == FALSE){
  install.packages("fitdistrplus", repos="http://cran.r-project.org")
}
if ("Rtsne" %in% i == FALSE){
  install.packages("Rtsne", repos="http://cran.r-project.org")
}
if ("RColorBrewer" %in% i == FALSE){
  install.packages("RColorBrewer", repos="http://cran.r-project.org")
}
if ("stringr" %in% i == FALSE){
  install.packages("stringr", repos="http://cran.r-project.org")
}
if ("circlize" %in% i == FALSE){
  install.packages("circlize", repos="http://cran.r-project.org")
}
if ("statmod" %in% i == FALSE){
  install.packages("statmod", repos="http://cran.r-project.org")
}


# Bioconductor
if ("BiocManager" %in% i == FALSE){
  install.packages("BiocManager", repos="http://cran.r-project.org")
}
if ("SIMLR" %in% i == FALSE){
  BiocManager::install("SIMLR", suppressUpdates=TRUE)
}
if ("edgeR" %in% i == FALSE){
  BiocManager::install("edgeR", suppressUpdates=TRUE)
}
if ("limma" %in% i == FALSE){
  BiocManager::install("limma", suppressUpdates=TRUE)
}

