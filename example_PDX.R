library(SingleCellSignalR)

# Define your working directory
setwd("~/example/")


# Preparing PDX data

file.human <- "example_dataset.txt"
file.mouse <- "example_dataset_mouse.txt"

mix.data <- data_prepare_pdx(file.human = file.human, file.mouse = file.mouse)


# Ligand/Receptor analysis

signal <- cell_signaling_pdx(mix.data = mix.data)
