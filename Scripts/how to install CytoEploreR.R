# Install & load devtools
tryCatch(library(devtools), error = function(e){
  install.packages("devtools")
  library(devtools)
})
# Install flowCore, flowWorkspace & openCyto from GitHub
install_github("RGLab/RProtoBufLib")
install_github("RGLab/cytolib")
install_github("RGLab/flowCore")
install_github("RGLab/flowWorkspace")
install_github("RGLab/flowStats")
install_github("RGLab/openCyto")

#then install this
# CytoExploreRData 
devtools::install_github("DillonHammill/CytoExploreRData")
# CytoExploreR 
devtools::install_github("DillonHammill/CytoExploreR")