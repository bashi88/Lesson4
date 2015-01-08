# Team: ZeaPol   
# Team Members: Roeland de Koning / Barbara Sienkiewicz    
# Date: 08/01/2015       
# Exercise 4

# Function removes the cloudcover from the NDVI images and crops the images to the correct size

CloudRemover <- function(NdviRaster, FolderLocation, Pattern) {
  Cloud <- list.files(FolderLocation, pattern = Pattern, full.names = TRUE) 
  CloudRaster <- raster(Cloud)
  CloudRemoval <- function(x, y) {
    x[y != 0] <- NA
    return(x)
  }
  
  CloudRasterCropped <- crop(CloudRaster, ProjectExtent)
  NdviRasterCropped <- crop(NdviRaster, ProjectExtent)
  NdviCloudFree <- overlay(x = NdviRaster, y = CloudRaster, fun = CloudRemoval)
  return(NdviCloudFree)
}