############### ECON20003 QM2 Tutorial 1 ############### 
##------------------------------------------------
# Zheng Fan; fan.z@unimelb.edu.au
# Contact me if you have any questions.

# You can access the code via:
# https://github.com/zhengf1/2023QM2
# or Canvas R_T1.docx file provided by David
##------------------------------------------------
############### ECON20003 QM2 Tutorial 1 ############### 

# Everything after "#" is a comment! 

rm(list=ls()) # remove (clear) everything in the environment 

##------------------------------------------------
## Set working directories
##------------------------------------------------
# It is very very important to set the working directories.
# Make sure your data set is in THIS folder.
# You can also manually find the folder and set working directories.
setwd("~/Dropbox/01 UoM-Teaching/2023-Summer-QM2/Tute1") # your path should be different 
# only do this, R knows the location of your data file

# Only when you set the working directories properly, you can read the data
# dt is the name of the data set I assigned, you may choose whatever you like
dt = read.csv("food.csv") 

##------------------------------------------------
## Basic command: Print
##------------------------------------------------
print(20001)
print("I like QM2")
test_number = 20    # the variable will be saved
print(test_number)
test_vector = c(21,12,31)
print(test_vector)

test_vector[1]+test_vector[2]+test_vector[3]
sum(test_vector)

##------------------------------------------------
## Replace the variable name 
##------------------------------------------------
# find the name of data set
names(dt)
# find the one that is "income"
names(dt) == "income"
# replace it with tutors
names(dt)[names(dt) == "income"] = "earnings"
names(dt)[2] = "earnings"
# let's rename it back
names(dt)[names(dt) == "earnings"] = "income"

##-----------------------------------------------
## GENERATING A NEW VARIABLE
##-----------------------------------------------
# We can generate a new variable from the existing data.
# For example, we could create the natural log (ln) of food_exp.
# (Natural logging is common in statistics for a number of reasons)
ln_foodexp = log(dt$food_exp)   # save as extra variable
# what if we want to save it to the data set
dt[,3] = ln_foodexp
names(dt)[3] = "log_income"
# but remember, this won't change the original data file

##------------------------------------------------
## Check data type!
##------------------------------------------------
# Check the class of each variable first!!! 
# You cannot perform calculation if it is not numerical. 
sapply(dt, class)
# or directly view in the environment

##------------------------------------------------
## If it shows "factor", do the following. Otherwise, SKIP 
##------------------------------------------------
# It might because of some default function settings in different computers. 
dt = read.csv("food.csv", stringsAsFactors = FALSE) 
# Check the class, it should now be character
sapply(dt, class)
# then proceed the rest

##------------------------------------------------
## Calculate descriptive statistics
##------------------------------------------------
# To get summary statistics on a variable (e.g., income):
print(summary(dt$income))
# If we wanted to avoid having to use the 'dataframename$'
# construction, we could define the income variable 
# using just its name:
income = dt$income
income <- dt$income
# Note that the '<-' symbol is generally 
# used in R to send a command.
# Then, we get the same with:
print(summary(income))
# Note that the summary statistics 
# omit the standard deviation.
# We can get that with:
print(sd(income))

##------------------------------------------------
## HISTOGRAM 
##------------------------------------------------
# To get a histogram of (say)
# food expenditure (food_exp):
hist(dt$food_exp)
# The histogram should appear in the Plots tab

# We could add some labels using:
hist(dt$food_exp, main="Food Expenditure", 
     xlab="$ per week",
     ylab = 'test',
     breaks=6,    # adjust the number of bins
     )
# (units of measurement made up!)

##-----------------------------------------------
## Scatter plot 
##-----------------------------------------------
# Often, we plot one variable against another
# in what we call a scatter plot (or scatter graph).
# To plot log(food expenditure) on the vertical axis
# against income on the horizontal axis, we use:
plot(income, ln_foodexp, 
     main="Log food expenditure vs. income", ylab="log(food expenditure)",
     pch = 15,   # the symbol of the points in the plot
     cex = 1.2,  # Symbol size
     col = 'red' # symbol color
     )
# Make your own beautiful plot
# more configurations, just check Google

##-----------------------------------------------
## WORKING WITH A SUBSET OF THE DATA 
##-----------------------------------------------
# By default, all results are produced 
# based on the whole sample of data.
# In this data set, we have 40 observations.
# Suppose for some reason that we wanted 
# to work with less than the full sample;
# i.e., a subset of the full sample.
# e.g., we want to include only those observations
# where food expenditure exceeds 200.
# There are 30 such observations.
# We need to create a new data frame that includes
# only these 30 observations (throwing out 10).
# We can use this command:
dt$food_exp > 200 # selection criterion
dtnew = dt[which(dt$food_exp>200),]
dtnew1 = dt[dt$food_exp>200,]
# This creates a new data frame called dtnew
# from dt
# which
# includes the observations from dt
# in which food_exp > 200.
# The comma before the closing square bracket
# tells RStudio to keep all the columns of
# the data set (i.e., food_exp and income)

# To redo the scatter plot using
# the subset (30 observations) of the original data,
# we can use:
plot(dtnew$income, log(dtnew$food_exp),
     main = "Subset scatter",
     ylab = "log(food expenditure)")

# That’s enough on RStudio for now to give you 
# a basic introduction. R code will be provided 
# for each tute for you to copy into RStudio 
# (in files named R_T*.docx), where * is the tute number. 
# Run this code (by clicking Source) 
# before each tutorial and take it with you 
# to the tute (e.g., on a laptop). The computer output 
# will form the basis of the tute work done in class.

