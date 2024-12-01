# Advent of Code 2024
# Day 1: Historian Hysteria

# Set working directory
setwd("C:/Users/hszyd/Documents/GitHub/Advent-of-Code-2024")

#-------------------------------------------------------------------------------

# --- Part One ---

# Hints:
# Pair up the smallest number in the left list with the smallest number in the
# right list, then the second-smallest left number with the second-smallest
# right number, and so on.
# Within each pair, figure out how far apart the two numbers are; you'll need
# to add up all of those distances.

# The plan:
# 1) Put the left and right lists into their own df
# 2) Order the df values from smallest to largest - converts into value strings
# 3) subtract the strings from one another
# 4) Add the remaining values together

# Import data
#Data <- read.csv("1_AoC_SampleData.csv")
Data <- read.csv("1_AoC_PuzzleInput.csv")

# Make columns into own df
Data_1 <- Data[1]
Data_2 <- Data[2]

# Order df with smallest value at top for each column
Data_1 <- Data_1[order(Data_1$List1, decreasing = FALSE),]
Data_2 <- Data_2[order(Data_2$List2, decreasing = FALSE),]

# Subract Data_1 from Data_2
# Make sure to take the absolute value
SubratctedDist <- abs(Data_1 - Data_2)

# Add SubtractedDist values together
FinalValuePart1 <- as.numeric(sum(SubratctedDist))

#-------------------------------------------------------------------------------

# --- Part Two ---

library(dplyr)

# Hints:
# This time, you'll need to figure out exactly how often each number from the
# left list appears in the right list. Calculate a total similarity score by
# adding up each number in the left list after multiplying it by the number of
# times that number appears in the right list.

# Import data
#Data <- read.csv("1_AoC_SampleData.csv")
Data <- read.csv("1_AoC_PuzzleInput.csv")

# The plan:
# 1) Determine how many times the left numbers are repeated in the right - loop
# 2) Multiply all the left values by the Similarity score
# 3) Add the Similarity scores together

# Loop through to get similarity score - create new column
Data$SimilarityScore <- 0
for (i in 1:nrow(Data)) {
  n <- length(which(Data$List2 == Data$List1[i]))
  Data$SimilarityScore[i] <- n
}

# Multiple List1 column by Similarity Score column
MultipliedValues <- Data$List1 * Data$SimilarityScore

# Sum the MultipliedValues together
FinalValuePart2 <- as.numeric(sum(MultipliedValues))
