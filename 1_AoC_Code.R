# Advent of Code 2024
# Day 1: Historian Hysteria

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

# Set working directory
setwd("C:/Users/hszyd/Documents/GitHub/Advent-of-Code-2024")

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
FinalValue <- as.numeric(sum(SubratctedDist))

#-------------------------------------------------------------------------------

# --- Part Two ---

# Hints:
# This time, you'll need to figure out exactly how often each number from the
# left list appears in the right list. Calculate a total similarity score by
# adding up each number in the left list after multiplying it by the number of
# times that number appears in the right list.

# Import data
Data <- read.csv("1_AoC_SampleData.csv")
#Data <- read.csv("1_AoC_PuzzleInput.csv")
