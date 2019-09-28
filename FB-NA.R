library(igraph)
library(dplyr)

friends <-read.csv(file.choose(),header=TRUE)
friends_nd <- distinct(friends)
friends_nsr <- friends_nd[(friends_nd$su_id != friends_nd$friend_id),]
friends_s <- t(apply(friends_nsr, 1, function(x) sort(x)))
friends_c <- friends_nsr[!duplicated(friends_s),]

g = graph.data.frame(friends_c,directed=FALSE)

gsize(g)
gorder(g)

g_eigen <- eigen_centrality(g)$vector

#write.csv(g_eigen , file = "eigen_vals.csv")

#---------------

g_ev  <- calculate.EV.brokerage(g)

#write.csv(g_ev, file = "ev_vals.csv")
