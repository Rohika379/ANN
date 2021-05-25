install.packages("igraph")

################### Network construction and visulaization  ########################################
library("igraph")
?igraph


######: Star Network #########
# Load the adjacency matrix from the csv file
Istar <- read.csv("C:\\Users\\rohika\\OneDrive\\Desktop\\360digiTMG assignment\\Datasets_Network Analytics\\instagram.csv", header = TRUE)
head(Istar) 

# create a star newtwork using adjacency matrix
?graph.adjacency 
# help file for the api graph.adjacency
IstarNW <- graph.adjacency(as.matrix(Istar), mode = "undirected")
plot(IstarNW)


###### Star Network #########
# Load the adjacency matrix from the csv file
Lstar <- read.csv("C:\\Users\\rohika\\OneDrive\\Desktop\\360digiTMG assignment\\Datasets_Network Analytics\\linkedin.csv", header = TRUE)
head(Lstar) 

# create a star newtwork using adjacency matrix
?graph.adjacency 
# help file for the api graph.adjacency
LstarNW <- graph.adjacency(as.matrix(Lstar), mode = "undirected")
plot(LstarNW)

###### Circula Network using Adjacency Matrix ########
circular <- read.csv("C:\\Users\\rohika\\OneDrive\\Desktop\\360digiTMG assignment\\Datasets_Network Analytics\\facebook.csv", header=TRUE)
head(circular) 
# shows initial few rows of the loaded file

# create a newtwork using adjacency matrix
CircularNW <- graph.adjacency(as.matrix(circular), mode="undirected", weighted=TRUE)
plot(CircularNW)
