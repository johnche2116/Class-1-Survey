# Step 1: Import the dataset from the GitHub site
# Note: We are reading the raw CSV file directly from GitHub

url <- "https://raw.githubusercontent.com/kijohnson/Advanced-Data-Analysis/main/Class%201%20Survey%20Fall%202025%202.csv"
C1survey <- read.csv(url)

# View the first few rows
head(C1survey)
# Step 2a: Number of observations (rows)
nrow(C1survey)

# Step 2b: Number of variables (columns)
ncol(C1survey)
# Step 3a: Rename columns to shorter names
names(C1survey) <- c(
  "id", "like_cats", "like_dogs", "have_desert", "slogan", "fav_day",
  "larkORowl", "fav_food", "fav_drink", "fav_season", "fav_month",
  "hobby", "program", "specialization", "stat_software", "R_exp",
  "coding_comfort", "coding_length", "top_three", "public_health_interest",
  "fav_num", "bday", "bmonth", "country", "state", "city", "highest_educ_level"
)

# Step 3b: Display the new column names
names(C1survey)
# Step 4: Count types of variables

# Use sapply to get the class/type of each column
var_types <- sapply(C1survey, class)
table(var_types)
# Step 5a: Check for unusual or missing values
table(C1survey$bday)
table(C1survey$bmonth)

# Step 5b: Convert to numeric if not already
C1survey$bday <- as.numeric(C1survey$bday)
C1survey$bmonth <- as.numeric(C1survey$bmonth)

# Optional: remove or fix bad values (e.g., birthday > 31 or < 1)
# Let's assume we remove rows with bad bday or bmonth
C1survey <- subset(C1survey, bday >= 1 & bday <= 31)
C1survey <- subset(C1survey, bmonth >= 1 & bmonth <= 12)

# Step 5c: Median of cleaned birthday and month
median(C1survey$bday, na.rm = TRUE)
median(C1survey$bmonth, na.rm = TRUE)
# Step 6a: Create season based on bmonth
C1survey$bseason <- ifelse(C1survey$bmonth %in% c(12, 1, 2), "Winter",
                           ifelse(C1survey$bmonth %in% c(3, 4, 5), "Spring",
                                  ifelse(C1survey$bmonth %in% c(6, 7, 8), "Summer", "Fall")))

# Step 6b: Table of bmonth by bseason
table(C1survey$bmonth, C1survey$bseason)

# Step 6c: Count total per season using addmargins
addmargins(table(C1survey$bseason))
# Step 7: Example analysis - What is the most common favorite season?
# Count the responses for favorite season
table(C1survey$fav_season)

# Comment: It looks like most students prefer [spring].

