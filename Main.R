# Team: ZeaPol   
# Team Members: Roeland de Koning / Barbara Sienkiewicz    
# Date: 08/01/2015       
# Exercise 4

# Load neccescary libraries and functions and set working directory
library(raster)
library(rgdal)

# Sources of functions
source('R/1_preprocessing_ndvi.R')
source('R/2_preprocessing_cloudmask.R')

# Produce the list to find the relevant file extensions needed for the above functions
list.files('data/rasterLT519/', pattern = glob2rx('*.tif'), full.names = TRUE)

# Arguments needed for NDVI function is the folder location extension e.g. 'data//rasterLC819' 
# and the two patterns to recognize the files of interest within the folder e.g. 'glob2rx('*band4.tif')'
LandSat8NDVI <- CalcNDVI('data//rasterLC819', Pattern1 = glob2rx('*band4.tif'), Pattern2 = glob2rx('*band5.tif'))
LandSat5NDVI <- CalcNDVI('data//rasterLT519', Pattern1 = glob2rx('*band3.tif'), Pattern2 = glob2rx('*band4.tif'))

# Project extent of interest
ProjectExtent <- intersect(extent(LandSat8NDVI), extent(LandSat5NDVI))

# Information needed for cloudremoval function is the folder location extension e.g 'data//rasterLC819' 
# and the pattern to recognize the file of interest within the folder 'glob2rx('*band4.tif')' etc
LandSat8NDVICloudFree <- CloudRemover(LandSat8NDVI,'data//rasterLC819',glob2rx('*cfmask.tif'))
LandSat5NDVICloudFree <- CloudRemover(LandSat5NDVI,'data//rasterLT519',glob2rx('*cfmask.tif'))

# Writing results of the cloudfree NDVI's into files
writeRaster(x=LandSat8NDVICloudFree, filename='output/LandSat8NDVICloudFree.grd', datatype='INT2S', overwrite=TRUE)
writeRaster(x=LandSat5NDVICloudFree, filename='output/LandSat5NDVICloudFree.grd', datatype='INT2S', overwrite=TRUE)


# Intermediary output
plot(LandSat8NDVICloudFree)
plot(LandSat5NDVICloudFree)

# Final output
NDVIdifference <- LandSat5NDVICloudFree - LandSat8NDVICloudFree 
writeRaster(x=NDVIdifference, filename='output/NDVIDifference.grd', datatype='INT2S', overwrite=TRUE)
plot(NDVIdifference, zlim= c(-2,2))
