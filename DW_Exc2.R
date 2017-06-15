library(readxl)

# Load the data in RStudio
titanic3 <- read_excel("C:/Users/keert/Desktop/DS-Spring Board/Data Wrangling/DW Exc2/titanic3.xls")

#Port of embarkation
titanic3$embarked <- replace(titanic3$embarked,is.na(titanic3$embarked),"S")

#Age:I've just taken the mean of remaining ages for the missing ages
x <- mean(titanic3$age,trim = 0.10, na.rm = T)

#Lifeboat
titanic3$age <- replace(titanic3$age,is.na(titanic3$age),x)
titanic3$age <- round(titanic3$age)

#Included has_cabin_number with a function
has_cabin_number <- function(x) {
  if(is.na(x) == TRUE){
    return(0)} else {
      return(1)
    }
}

titanic3$has_cabin_number <- sapply(titanic3$cabin,has_cabin_number)

write.csv(titanic3,"titanic_clean.csv")