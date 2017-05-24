n_draws <- 200000

pA = runif(n_draws, 0, 1)
pB = runif(n_draws, 0, 1)

hist(pA)
hist(pB)

generative_model <- function(pA, pB) {
  subcribersA <- rbinom(1, 16, pA)
  subcribersB <- rbinom(1, 16, pB)
  c(subcribersA = subcribersA, subcribersB = subcribersB)
}


sim_data <- as.data.frame(t(sapply(1:n_draws, function(i) {
  generative_model(pA[i], pB[i])
})))

pAposterior <- pA[sim_data$subcribersA == 4 & sim_data$subcribersB == 8] 
pBposterior <- pB[sim_data$subcribersA == 4 & sim_data$subcribersB == 8] 

posterior <- as.data.frame(cbind(pAposterior,pBposterior))
names(posterior) <- c("pA","pB")

#hist(posterior$pA)
#hist(posterior$pB)
#nrow(posterior)

#hist(posterior$pB -posterior$pA)
mean(posterior$pB -posterior$pA > 0)

prop.test(x=c(8,4),n=c(16,16),alternative="greater")