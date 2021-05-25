
import pandas as pd
import numpy as np
import networkx as nx 
import matplotlib.pyplot as plt

# Degree Centrality
G = pd.read_csv("C:\\Users\\rohika\\OneDrive\\Desktop\\360digiTMG assignment\\Datasets_Network Analytics\\connecting_routes.csv",header=None)
G.rename(columns={2:"source", 4:"destination"},inplace="TRUE")
G = G.iloc[:, 2:8]

g = nx.Graph()

g = nx.from_pandas_edgelist(G, source = 'source', target = 'destination')

print(nx.info(g))

b = nx.degree_centrality(g)  # Degree Centrality
print(b) 

pos = nx.spring_layout(g, k = 0.15)
nx.draw_networkx(g, pos, node_size = 25, node_color = 'blue')

# closeness centrality
closeness = nx.closeness_centrality(g)
print(closeness)

## Betweeness Centrality 
b = nx.betweenness_centrality(g) # Betweeness_Centrality
print(b)




