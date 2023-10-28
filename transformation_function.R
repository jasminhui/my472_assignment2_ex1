# Load tidyverse package
library(tidyverse)

# Define a function that performs input transformation on a dataset
transform_function <- function(data, type) {
  # Ensure that dataset contains the columns 'height' and 'age'
  if("height" %in% colnames(data) & "age" %in% colnames(data)) {
    # Use the 'mutate' function to calculate yearly growth
    data <- data %>%
      mutate(yearly_growth = height / age)
    return(data)
  } else {
    stop("There is no suitable data in this dataset to calculate yearly growth.")
  }
}

data(Loblolly)

# Call function on 'loblolly' dataset
Loblolly_transformed <- transform_function(Loblolly)

# Print first few rows of transformed dataset
head(Loblolly_transformed)
