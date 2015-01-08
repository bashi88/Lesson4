# Team: ZeaPol   
# Team Members: Roeland de Koning / Barbara Sienkiewicz    
# Date: 08/01/2015       
# Exercise 4

# Function calculates NDVI for both Landsat 5 and Landsat 8 datasets
# Arguments are:
# - folder location,
# - 2 x pattern 

calcndvi <- function(FolderLocation, Pattern1, Pattern2) {
  
  red <- list.files(FolderLocation, pattern = Pattern1, full.names = TRUE)
  infra <- list.files(FolderLocation, pattern = Pattern2, full.names = TRUE)
  
  rasterred <- raster(red)
  rasterinfra <- raster(infra)
  
  ndvi <- (rasterinfra - rasterred) / (rasterinfra + rasterred)
   
  return(ndvi)
}










