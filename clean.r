getwd()
# 

df <- read.csv('filepath')

nrow(df)
# 

ncol(df)
# 

colnames(df)
#     

new_df = data.frame(df$A, df$B, df$C, df$D, df$E, 
                    df$F, df$G, df$H)

new_df
View(new_df)

new_df_2 <- new_df # copying the dataframe to make edits on it
View(new_df_2)

# To see the data types of the columns: Create a data frame with column names and data types
data_types_df <- data.frame(Column = names(new_df_6), DataType = sapply(new_df_6, class))


# Display the data types data frame
print(data_types_df)

# Column  DataType
# 


library(dplyr)

# Remove dollar signs and commas from all columns:
new_df_3 <- mutate_all(new_df_2, ~gsub("\\$|,", "", .))

View(new_df_3)


# Removes parentheses from columns and put a hyphen in front:
new_df_4 <- mutate_all(new_df_3, ~gsub("\\((.*?)\\)", "-\\1", .))

View(new_df_4)


# replacing all standalone hyphens "-" with "0"
new_df_5 <- mutate_all(new_df_4, ~gsub("^-$", "0", .))

View(new_df_5)

new_df_6 <- new_df_5


# Convert columns 3-8 from character to numeric datatype:
new_df_6$C <- as.numeric(new_df_6$C)
new_df_6$D <- as.numeric(new_df_6$D)
new_df_6$E <- as.numeric(new_df_6$E)
new_df_6$F <- as.numeric(new_df_6$F)
new_df_6$G <- as.numeric(new_df_6$G)
new_df_6$H <- as.numeric(new_df_6$H)


# Checking my work out of X rows total - comparing original df to most recent:
# to compare to the original data frame "new_df", I want to count how many times "-" appears in a "new_df" columns:
count_minus_alone <- sum(grepl("^-$", new_df$C)) # 
count_minus_alone <- sum(grepl("^-$", new_df$D)) # 
count_minus_alone <- sum(grepl("^-$", new_df$E)) # 
count_minus_alone <- sum(grepl("^-$", new_df$F)) # 
count_minus_alone <- sum(grepl("^-$", new_df$G)) # 
count_minus_alone <- sum(grepl("^-$", new_df$H)) # 

# Display the count of standalone "-" in column "A"
print(count_minus_alone)


# and I compare the above counts to the ones below:
# counting number of zeroes "0" that appear in most recent dataframe
count_0 <- sum(new_df_6$C == 0) # 
count_0 <- sum(new_df_6$D == 0) # 
count_0 <- sum(new_df_6$E == 0) # 
count_0 <- sum(new_df_6$F == 0) # 
count_0 <- sum(new_df_6$G == 0) # 
count_0 <- sum(new_df_6$H == 0) # 

print(count_0)


new_df_7 <- new_df_6

# separate Column A into 2 columns with Agency Code and Agency Name:
# Create a new column "AA" with the first 3 characters from column "A"
new_df_7$A <- substr(new_df_7$A, 1, 3)

# Create a new column "B" with everything after the space in column "A"
new_df_7$Name <- gsub("^[0-9]{3}\\s", "", new_df_7$A)

# Print the updated DataFrame
print(new_df_7)
View(new_df_7)


# # Writing dataframe to a csv file
# # Specify the file path where you want to save the CSV file
# csv_file_path <- "filepath"
# 
# # Write the dataframe to a csv file
# write.csv(new_df_11, file = csv_file_path, row.names = FALSE)


# Writing dataframe to an Excel file (because I want to keep the leading zeroes
# in the new Agency_Code column I just created):
# install.packages("openxlsx")
library(openxlsx)

# specifying the file path where I want to save the excel file
xlsx_file_path <- "filepath"

# Write the dataframe to an Excel file
write.xlsx(new_df_8, xlsx_file_path)
