n <- 100 # number of cards
r <- replicate(10^4,sum(sample(n)==(1:n))) # shuffle; count matches
sum(r>=1)/10^4 # proportion with a match