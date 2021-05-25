

install.packages("igraph")
library("igraph")

##### Example: Airlines Network using Edge List #####
## Data source: http://openflights.org/data.html

Flight <- read.csv("C:\\Users\\rohika\\OneDrive\\Desktop\\360digiTMG assignment\\Datasets_Network Analytics\\flight_hault.csv", header = FALSE)

colnames(Flight) <- c("Airport ID","Name","City","Country","IATA_FAA","ICAO","Latitude","Longitude","Altitude","Timezone","DST","Tz database timezone")
head(Flight)

airline_routes <- read.csv("C:\\Users\\rohika\\OneDrive\\Desktop\\360digiTMG assignment\\Datasets_Network Analytics\\connecting_routes.csv", header=FALSE)
colnames(airline_routes) <- c("flights", " ID", "main Airport", "main Airport ID", "Destination ","Destination  ID","haults","machinary")
head(airline_routes)

AirlineNW <- graph.edgelist(as.matrix(airline_routes[, c(3, 5)]), directed = TRUE)
plot(AirlineNW)

## How many airports are there in the network?
?vcount
vcount(AirlineNW)

## How many connections are there in the network?
?ecount
ecount(AirlineNW)

# Which airport has most flights coming in, and how many?
?degree
indegree <- degree(AirlineNW, mode = "in")
max(indegree)
index <- which(indegree == max(indegree))
indegree[index]
which(Flight$IATA_FAA == "ATL")
Flight[3584, ]

# Which airport has most flights going out of, and how many?
outdegree <- degree(AirlineNW, mode = "out")
max(outdegree)
index <- which(outdegree == max(outdegree))
outdegree[index]
which(Flight$IATA_FAA == "ATL")
Flight[3584, ]

# Which airport is close to most of the airports (in terms of number of flights)
?closeness
closeness_in <- closeness(AirlineNW, mode = "in", normalized = TRUE)
max(closeness_in)
index <- which(closeness_in == max(closeness_in))
closeness_in[index]
which(Flight$IATA_FAA == "FRA")
Flight[338, ]

# Which airport comes in between most of the routes and hence is an important international hub?
?betweenness
btwn <- betweenness(AirlineNW, normalized = TRUE)
max(btwn)
index <- which(btwn == max(btwn))
btwn[index]
which(Flight$IATA_FAA == "LAX")
Flight[3386,]

# Degree, closeness, and betweenness centralities together
centralities <- cbind(indegree, outdegree, closeness_in, btwn)
colnames(centralities) <- c("inDegree","outDegree","closenessIn","betweenness")
head(centralities)

# correlations of the centralities
cor(centralities)

# Any pair with low correlation?
plot(centralities[, "closenessIn"], centralities[, "betweenness"])
?subset
subset(centralities, (centralities[,"closenessIn"] > 0.015) & (centralities[,"betweenness"] > 0.06))
Flight[which(Flight$IATA_FAA == "LAX"), ]
Flight[which(Flight$IATA_FAA == "CDG"), ]
Flight[which(Flight$IATA_FAA == "ANC"), ]

subset(centralities, (centralities[, "closenessIn"] < 0.005) & (centralities[, "betweenness"] < 0.02))


