# Team: ZeaPol   
# Team Members: Roeland de Koning / Barbara Sienkiewicz    
# Date: 08/01/2015       
# Exercise 4

calcndvi <- function(FolderLocation,Pattern1,Pattern2) {
  
  red <- list.files(FolderLocation, pattern = Pattern1, full.names = TRUE)
  infra <- list.files(FolderLocation, pattern = Pattern2, full.names = TRUE)
  
  rasterred <- raster(red)
  rasterinfra <- raster(infra)
  
  ndvi <- (rasterinfra - rasterred) / (rasterinfra + rasterred)
   
  return(ndvi)
}










