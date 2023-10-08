# data_clean_for_dashboard

This is the R code I used to clean and manipulate a csv file before importing it into Power BI for visualization.

My needs:
1) There were many numbers wrapped in parentheses from the initial Excel spreadsheet, which meant that they were negative
values. I needed to remove the parentheses and add a hyphen to the beginning of those values
2) I needed to remove dollars signs and commas
3) There was a column containing text that needed to be de-concatenated and split into two columns.
4) There was also a standalone hyphen in many cells, which stood for $0 rather than null values, so I needed to replace all of those particular hyphens with zeroes.
5) I needed to transform certain column from a character/object datatype to numeric
