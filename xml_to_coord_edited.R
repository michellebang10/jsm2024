# Function to get a nice df of coordinates 
# This function is edited to work for the new .xml files

xml_to_coordinates2 <- function(input_data_path) {
  library(xml2)
  
  
  #### Importing the data and arranging it into a useful dataframe ####
  input_xml_data <- read_xml(input_data_path)
  
  input_xml_as_list <- as_list(input_xml_data) #Not very elegant, but should work.
  
  input_xml_as_list <- input_xml_as_list[[1]]
  
  input_data_type_1 = list()
  input_data_type_2 = list()
  
  for(i in 1:length(input_xml_as_list)){
    if(toString(input_xml_as_list[[i]][[1]]) == "fluorescent"){ #GFP kernels
      input_data_type_1 <- append(input_data_type_1, input_xml_as_list[i])
    } else if (toString(input_xml_as_list[[i]][[1]]) == "nonfluorescent"){ #non-GFP kernels
      input_data_type_2 <- append(input_data_type_2, input_xml_as_list[i])
    }
  }
  
  #Making the dataframes with columns for type, x coordinate, and y coordinate.
  type_1_df <- data.frame("type" = rep("GFP", length(input_data_type_1)),
                          "x" = as.numeric(unlist(sapply(input_data_type_1, function(x) x$centroid$MarkerX))), 
                          "y" = as.numeric(unlist(sapply(input_data_type_1, function(x) x$centroid$MarkerY))))
  
  type_2_df <- data.frame("type" = rep("WT", length(input_data_type_2)),
                          "x" = as.numeric(unlist(sapply(input_data_type_2, function(x) x$centroid$MarkerX))), 
                          "y" = as.numeric(unlist(sapply(input_data_type_2, function(x) x$centroid$MarkerY))))
  final_df <- rbind(type_1_df, type_2_df)
  
  return(final_df)
  
}

