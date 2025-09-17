n <- 10; k <- 5

sample(n,k) # sample k elements from n
sample(n,k,replace=TRUE) # sample k elements from n with replacement
sample(n,k,replace=TRUE,prob=c(0.1,0.2,0.3,0.4,0.5)) # sample k elements from n with replacement and probability

