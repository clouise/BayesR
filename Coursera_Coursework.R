# Suppose we are giving two students a multiple-choice exam with 40 questions, 
# where each question has four choices. We don't know how much the students
# have studied for this exam, but we think that they will do better than just
# guessing randomly. 
# 1) What are the parameters of interest?
# 2) What is our likelihood?
# 3) What prior should we use?
# 4) What is the prior probability P(theta>.25)? P(theta>.5)? P(theta>.8)?
# 5) Suppose the first student gets 33 questions right. What is the posterior
#    distribution for theta1? P(theta1>.25)? P(theta1>.5)? P(theta1>.8)?
#    What is a 95% posterior credible interval for theta1?
# 6) Suppose the second student gets 24 questions right. What is the posterior
#    distribution for theta2? P(theta2>.25)? P(theta2>.5)? P(theta2>.8)?
#    What is a 95% posterior credible interval for theta2?
# 7) What is the posterior probability that theta1>theta2, i.e., that the 
#    first student has a better chance of getting a question right than
#    the second student?

# 3)
curve(dbeta(x,1,1))
curve(dbeta(x,4,2))
curve(dbeta(x,6,3))

# 4)
1-pbeta(.25,6,3)
1-pbeta(.5,6,3)
1-pbeta(.8,6,3)

# 5) Beta(39,9)
curve(dbeta(x,39,10))
1-pbeta(.25,39,10)
1-pbeta(.5,39,10)
1-pbeta(.8,39,10)

qbeta(.025,39,10)
qbeta(.975,39,10)

# 6) Beta(30,19)
curve(dbeta(x,30,19))

1-pbeta(.25,30,19)
1-pbeta(.5,30,19)
1-pbeta(.8,30,19)

qbeta(.025,30,19)
qbeta(.975,30,19)

# 7)
theta1=rbeta(2000,39,10)
theta2=rbeta(2000,30,19)
mean(theta1>theta2)