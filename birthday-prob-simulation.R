k <- 23
1-prod((365-k+1):365)/365^k

# R has inbuilt function to calculate this problem specifically which is CRAZY!
pbirthday(k)
pbirthday(k, coincident=3) # probability of 3 people having the same birthday

# qbirthday is the inverse of pbirthday
qbirthday(0.5) # probability of 2 people having the same birthday
qbirthday(0.5, coincident=3) # probability of 3 people having the same birthday

# To simulate the bday prob
b <- sample(1:365,k,replace=TRUE)
# tabulate used to generate random bday prob
tabulate(b) # can use table as well but table is slower

r <- replicate(10^4, max(tabulate(sample(1:365,23,replace=TRUE))))
sum(r>=2)/10^4