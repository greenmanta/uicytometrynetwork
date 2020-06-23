# Load required packages
library(CytoExploreR)
library(CytoExploreRData)

# Download Compensation FCS files
cyto_save(Compensation,
          save_as = "Compensation-Samples")

# Download Activation FCS files
cyto_save(Activation,
          save_as = "Activation-Samples")
# Setup compensation controls
gs <- cyto_setup("Compensation-Samples",
                 gatingTemplate = "Compensation-gatingTemplate.csv")

# Transform fluorescent channels - default logicle transformations
gs <- cyto_transform(gs)

# Gate Cells
cyto_gate_draw(gs,
               parent = "root",
               alias = "Cells",
               channels = c("FSC-A", "SSC-A"))

# Gate Single Cells
cyto_gate_draw(gs,
               parent = "Cells",
               alias = "Single Cells",
               channels = c("FSC-A", "FSC-H")) 

# Compute spillover matrix
spill <- cyto_spillover_compute(gs,
                                parent = "Single Cells",
                                spillover = "Spillover-Matrix.csv")
# Edit spillover matrix
spill <- cyto_spillover_edit(gs,
                             parent = "Single Cells",
                             spillover = "Spillover-Matrix.csv")

# Gate T Cells and Dedritic Cells
cyto_gate_draw(gs,
               parent = "Live Cells",
               alias = c("T Cells", "Dendritic Cells"),
               channels = c("CD11c", "Va2"),
               type = c("ellipse", "rectangle"),
               overlay = NIL)
