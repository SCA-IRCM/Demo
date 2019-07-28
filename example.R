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
class = cell_classifier(data=data, genes=rownames(data), markers = my.markers)

# Cluster analysis
clust.ana = cluster_analysis(data = data, genes = rownames(data), cluster = cluster, markers = my.markers)

# Proceed to cell signaling
signal = cell_signaling(data = data, genes = genes, cluster = cluster,species = "homo sapiens")

# Create internal and interface network
net = networks(data = data, signal = signal, genes = genes, cluster = cluster)
internal = net$internal_network

# Calculate internal active pathways
pw = interaction2pw(internal)

# Show interactions invovled in a spedific pathway
pathway = "Translocation of ZAP-70 to Immunological synapse"
c.name = "cluster 3"
int = pathway2interactions(pathway = pathway, c.name = c.name)

# Visualization
expression.plot(data = data, name = "CD14", tsne = tsne)
expression.plot.2(data = data, name.1 = "CD40LG", name.2 = "CD40", tsne = tsne)

visualize(inter = signal, show.in = c(1),write.out = TRUE)
