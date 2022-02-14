library(Distance)

#loads in data
bowhead_data <- statsecol::bowhead_LT
par(mfrow=c(1,1))

#shows histogram of distances to animals
hist(bowhead_data$distance,main="Histogram of Distances from Observer to Cluster of Whales",xlab="Distance",breaks=10)



#fits models with different assumptions of key functions and series adjustment
bowhead.hn.null <- ds(data = bowhead_data, key = "hn", adjustment = NULL)
bowhead.hn.cos  <- ds(data = bowhead_data, key = "hn", adjustment = "cos")
bowhead.hn.herm <- ds(data = bowhead_data, key = "hn", adjustment = "herm")
bowhead.hn.poly <- ds(data = bowhead_data, key = "hn", adjustment = "poly")
bowhead.hr.null <- ds(data = bowhead_data, key = "hr", adjustment = NULL)
bowhead.hr.cos  <- ds(data = bowhead_data, key = "hr", adjustment = "cos")
bowhead.hr.herm <- ds(data = bowhead_data, key = "hr", adjustment = "herm")
bowhead.hr.poly <- ds(data = bowhead_data, key = "hr", adjustment = "poly")

#summarises AIC and p values of CvM test etc of models
summarize_ds_models(bowhead.hn.null,bowhead.hn.cos,bowhead.hn.herm,bowhead.hn.poly,bowhead.hr.null,bowhead.hr.cos,bowhead.hr.herm,bowhead.hr.poly,output = "plain")

par(mfrow=c(1,2))

#plots fitted detection function over histogram
plot(bowhead.hn.null)
#shows goodness of fit test of half-normal model
gof_ds(bowhead.hn.null)

#gives summary of results of analysis using half-normal detection function
summary(bowhead.hn.null)




