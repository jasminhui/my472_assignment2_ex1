# Load tidyverse package
library(tidyverse)

# Define a function that performs input transformation on a dataset
transform_function <- function(data, type) {
  # Ensure that dataset contains the columns 'height' and 'age'
  if("height" %in% colnames(data) & "age" %in% colnames(data)) {
    if (type == "yearly_growth") {
    # Use the 'mutate' function to calculate yearly growth
    data <- data %>%
      mutate(yearly_growth = height / age)
    } else if (type == "log_height") {
      # Calculate natural logarithm of height
      data <- data %>%
        mutate(log_height = log(height))
    } else {
      stop("Transformation type is not available.")
    }
    return(data)
  } else {
    stop("There is no suitable data in this dataset to perform transformations.")
  }
}

data(Loblolly)

# Call function on 'loblolly' dataset to calculate yearly growth
Loblolly_transformed_growth <- transform_function(Loblolly, "yearly_growth")

# Print first few rows of transformed dataset
head(Loblolly_transformed_growth)

# Call function on 'loblolly' dataset to calculate natural logarithm of height
Loblolly_transformed_log_height <- transform_function(Loblolly, "log_height")

# Print first few rows of transformed dataset
head(Loblolly_transformed_log_height)
