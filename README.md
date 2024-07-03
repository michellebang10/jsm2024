# jsm2024
R Code for JSM 2024 poster presentation. 

# Description of files 
1) spatial_analysis_cleaned.rmd
   - The general code for the statistical outputs are from here.
   - Note that the path the file is uploaded from should be changed to match the path of the current user.
   - Remember to have the packages required at the top to be installed.
   - write.table(---) writes a .tsv table to the current folder the .rmd file resides.
   - Currently, the bins sizes are set to be 16 bins with the ends being removed to result in 14 bins at the end. Should be fairly straightforward to switch bin sizes are needed as documented in the code. 
2) spatial_graphs_for_paper.rmd
   - The general code for the graph outputs. This include scatterplots and bar graphs.
   - Similar to before, remember to change the path to match the path of the current user.
   - A new folder, spatial_graphs_files should be created to store all the graphs created.
   - Graphs are stored in a pdf corresponding to the specific allele and type of graph. In other words, all observations of an allele of a particular graph (ex. scatterplot vs bar graph) should be stored in one pdf. 
3) xml_to_coordinates.R
   - Converts .xml files into coordinate form for old .xml files. 
4) xml_to_coord_edited.R
   - Converts .xml files into coordinate form for the new, EarVision, .xml files. 
5) coordinates_to_xbins.R
   - Converts coordinates into bins. 

# Description of output files 
(All from spatial_analysis_for_paper_updated.rmd)
1) prop_true_pval.tsv
   - Includes statistics from pi0est that estimates the proportion of true null p-values. The complement of the the proportion of true null p-values are referred to as "True Prop". In "True Prop", the p-value used for each observation depends on the best fit (Lin vs. Quad).
   - In "Lin Prop", all the p-values are from the linear model.
   - In "Quad Prop", all the p-values are from the quadratic model.
   - "Adj P-Val (<.1)" is the proportion of adjusted p-values, calculated using the BH-method, using the best fitting model's p-value, that is less than .1.
   - Similar to before, "Adj P-Val (<.1) from Lin" and "Adj P-Val (<.1) from Quad" uses p-values all from the linear or quadratic model, respectively.
   - The SE and CI columns corresponds to the "True Prop" column, in which the best fitting model's p-value is used for calculation.
2) incr_decr.tsv
   - The goal of this dataframe is to determine what the overall trend of the ears are.
   - All observations are listed. p-value and adj p-value are from the model of best fit (Lin or Quad) and the model chosen is listed. The actual coefficient for Linear is listed for all ears, and Quadratic coefficient is only listed for the ears in which the quadratic model is a better fit. If the adj p-value is less than .1, "I" for increasing and "D" for decreasing are noted on the last "Inc/Dec" column (depending on the sign of the linear coefficient if the model of best fit was linear). If the model of best fit was quadratic, "Check" is listed as we have to manually check the trend. For all other non-significant observations, "NA" is noted on the last column.
3) significant_observations.tsv
   - This is basically incr_decr.tsv but only the signficiant (adj p-value less than .1) observations.
4) spatial_analysis_for_paper.tsv
  - For each observation, name of allele, and actual transmission rates are listed.
  - p_alue and adj_p_value refers to the p-values from linear model.
  - p_value_sq adn adj_p_value_sq refers to the p-values from quadratic model.
5) stat_sum_paper.tsv
   - For each allele, the average linear and quadratic coefficients are listed and also its corresponding SE and Var.
6) mean_count.tsv
   - For each allele, the mean transmission rate and the number of observations are listed.

(All from spatial_graphs_cleaned.rmd)
1) {allele}_basic.pdf
   - Bar graph of WT vs. GFP for all observations.
2) {allele}_graphs.pdf
   - Bar graph of WT count depending on bin.
   - Bar graph of GFP count depending on bin.
   - Stacked bar graph of WT/GFP count depending on bin.
3) {allele}_xcoordsbytr_linear_ends.pdf
   - Scatterplot of transmission rate vs. bins/x-coord with linear line fitted.
4) {allele}_xcoordsbytr_quad_ends.pdf
   - Scatterplot of transmission rate vs. bins/x-coord with quadratic line fitted. 
