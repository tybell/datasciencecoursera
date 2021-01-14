library(readr)

url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for'

# We are dealing with a fixed width text file with 9 columns.
# I simply count the number of characters in each column by hand.
# 9 widths for 9 columns
widths = c(10, 9, 4, 9, 4, 9, 4, 9, 4)

x <- read_fwf(file = url, skip = 4, fwf_widths(widths))

#Calculate sum of entries in fourth column
print(sum(x[,4]))