# Coordinates_to_xbins
#Takes a data frame and a number of bins [must be greater than 1 (no error checking)].
#Outputs a data frame with the type of kernel counted up per bin.

coordinates_to_xbins <- function(input_df, num_bins) {

  #Calculate amount of length per bin.
  xmax = max(input_df$x)
  xmin = min(input_df$x)
  bins = (xmax-xmin)/num_bins
  
  #Split data into bins by brute force.
  
  #Make new data frame for column by column.
  final_df = data.frame(bins = seq(xmin,xmax,bins), WT = c(1:(num_bins+1))*0, GFP = c(1:(num_bins+1))*0)
  
  #Sequences for the for-loops that come next.
  sequence = seq(1, nrow(input_df)) 
  sequence2 = seq(1, num_bins)
  
  #The brute force part, requires that the final_df is empty or it will double count.
  
  for (val in sequence) {                                             #For each value.
    for(i in sequence2) {                                              #For each bin.
      
      #if the value is in the bin, but not any bins before it
      if ((input_df$x[val] >= final_df$bins[i]) && (input_df$x[val] < final_df$bins[i+1]) ) { 
        if (input_df$type[val] == "WT") {                            #Has to check if the kernel is WT or GFP then increments bin.
          final_df$WT[i] = final_df$WT[i] + 1                      
        }               
        else if (input_df$type[val] == "GFP") {
          final_df$GFP[i] = final_df$GFP[i] + 1
        }
      }
      
    }
  }
  
  #Remove excess row.
  final_df = final_df[-c(num_bins+1),]
  
  return(final_df)
}
