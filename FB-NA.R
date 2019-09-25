library(igraph)

friends <-read.csv(file.choose(),header=TRUE)
head(friends)


g =graph.data.frame(friends,directed=FALSE)

gsize(g)
gorder(g)

g_eigen <- eigen_centrality(g)$vector

#write.csv(g_eigen , file = "eigen_vals.csv")


#---------------


g_ev  <- calculate.EV.brokerage(g)

#write.csv(g_ev, file = "ev_vals.csv")
