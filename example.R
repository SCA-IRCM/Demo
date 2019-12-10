library(SingleCellSignalR)

# Define your working directory
setwd("~/example/")

# Define the file of interest you want to work with
file = "example_dataset.txt"

# Prepare the data for the analysis
data = data_prepare(file = file)
genes = rownames(data)

# Proceed to clustering
clust = clustering(data = data,n = 10, method = "simlr")
cluster = clust$cluster
tsne = clust$`t-SNE`

# Cell classification
my.markers = markers(c("immune"))
class = cell_classifier(data=data, genes=genes, markers = my.markers)

# Cluster analysis
clust.ana = cluster_analysis(data = data, genes = genes, cluster = cluster, markers = my.markers)

# Proceed to cell signaling
signal = cell_signaling(data = data, genes = genes, cluster = cluster,species = "homo sapiens")

# Visualization
visualize(inter = signal, show.in = c(1),write.out = TRUE)
expression.plot(data = data, name = "CD14", tsne = tsne)
expression.plot.2(data = data, name.1 = "CD40LG", name.2 = "CD40", tsne = tsne)

# Create interface network
inter.net = inter_network(data = data, signal = signal, genes = genes, cluster = cluster)

# Show interactions downstream a specific receptor
intra = intra_network(goi = "S1PR1",data = data,genes = genes,cluster = cluster,coi="cluster 3",signal=signal,plot = T,cell.prop = 0.2,c.names=c.names)


