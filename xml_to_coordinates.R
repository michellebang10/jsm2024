#Function to get a nice df of coordinates 
xml_to_coordinates <- function(input_data_path) {
  library(xml2)
  
  
  #### Importing the data and arranging it into a useful dataframe ####
  input_xml_data <- read_xml(input_data_path)
  
  input_xml_as_list <- as_list(input_xml_data) #Not very elegant, but should work.
  
  input_data_type_1 <- input_xml_as_list[[1]][[2]][[2]] #These should be the GFP kernels as long as the person annotating using type "1" for GFP.
  input_data_type_1 <- input_data_type_1[-1] #Removing the first sub-list which is just a number string of the data type.
  input_data_type_2 <- input_xml_as_list[[1]][[2]][[3]] #These should be non-GFP kernels.
  input_data_type_2 <- input_data_type_2[-1]
  
  #Making the dataframes with columns for type, x coordinate, and y coordinate/
  type_1_df <- data.frame("type" = rep("GFP", length(input_data_type_1)),
                          "x" = as.numeric(unlist(sapply(input_data_type_1, "[[", 1))), 
                          "y" = as.numeric(unlist(sapply(input_data_type_1, "[[", 2))))
  
  type_2_df <- data.frame("type" = rep("WT", length(input_data_type_2)),
                          "x" = as.numeric(unlist(sapply(input_data_type_2, "[[", 1))), 
                          "y" = as.numeric(unlist(sapply(input_data_type_2, "[[", 2))))
  final_df <- rbind(type_1_df, type_2_df)
  
  return(final_df)
  
}

