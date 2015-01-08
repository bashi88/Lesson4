# Team: ZeaPol   
# Team Members: Roeland de Koning / Barbara Sienkiewicz    
# Date: 08/01/2015       
# Exercise 4

# Function calcndvi calculates NDVI for both Landsat 5 and Landsat 8 datasets

CalcNDVI <- function(FolderLocation, Pattern1, Pattern2) {
  
  Red <- list.files(FolderLocation, pattern = Pattern1, full.names = TRUE)
  Infra <- list.files(FolderLocation, pattern = Pattern2, full.names = TRUE)
  
  RasterRed <- raster(Red)
  RasterInfra <- raster(Infra)
  
  NDVI <- (RasterInfra - RasterRed) / (RasterInfra + RasterRed)
   
  return(NDVI)
}










