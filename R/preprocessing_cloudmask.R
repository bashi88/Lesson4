# Team: ZeaPol   
# Team Members: Roeland de Koning / Barbara Sienkiewicz    
# Date: 08/01/2015       
# Exercise 4

# function removes the cloudcover from the NDVI images and crops the images to the correct size

cloudremover <- function(ndviraster,FolderLocation,Pattern) {
  
  cloud<- list.files(FolderLocation, pattern = Pattern, full.names = TRUE)
  
  cloudraster <- raster(cloud)
  
  cloudremoval <- function(x, y){
    x[y != 0] <- NA
    return(x)}
  
  cloudrastercropped <- crop(cloudraster,ProjectExtent)
  ndvirastercropped <- crop(ndviraster,ProjectExtent)
  
  ndvicloudfree <- overlay(x = ndviraster, y = cloudraster, fun = cloudremoval)
  
  return(ndvicloudfree)
}


writeRaster(x=ndvi1CloudFree, filename='data/ndviCloudFree1.grd', datatype='INT2S')
writeRaster(x=ndvi2CloudFree, filename='data/ndviCloudFree2.grd', datatype='INT2S')

