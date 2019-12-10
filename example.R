library(SingleCellSignalR)

# Define your working directory
setwd("~/example/")
setwd("c:/Users/simon.cabello/Documents/GitHub/Demo/")

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

# Create internal and interface network
inter.net = inter_network(data = data, signal = signal, genes = genes, cluster = cluster)

# Show interactions invovled in a specific pathway
pathway = "Translocation of ZAP-70 to Immunological synapse"
c.name = "cluster 3"
int = pathway2interactions(pathway = pathway, c.name = c.name)

intra = intra_network(goi = "ADCY9",data = data,genes = genes,cluster = cluster,coi="B-cells",signal=signal,plot = T,cell.prop = 0.2,c.names=c.names)

# Visualization
expression.plot(data = data$complete.dataset, name = "CD14", tsne = tsne)
expression.plot.2(data = data$complete.dataset, name.1 = "CD40LG", name.2 = "CD40", tsne = tsne)

visualize(inter = signal, show.in = c(1),write.out = TRUE)
