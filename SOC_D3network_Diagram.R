library("readxl")
library(networkD3)
library(dplyr)
# SOC_Links<-read_excel("D:/Dropbox/A_ALEX 2020/RR/SOC_Activity.xlsx",sheet = "FVLink")
# SOC_Nodes<-read_excel("D:/Dropbox/A_ALEX 2020/RR/SOC_Activity.xlsx",sheet = "FVnode")

SOC_Links<-read_excel("D:/Dropbox/A_ALEX 2020/RR/SOC_Activity.xlsx",sheet = "RVLink")
SOC_Nodes<-read_excel("D:/Dropbox/A_ALEX 2020/RR/SOC_Activity.xlsx",sheet = "RVnode")

##list of centers
# AH Orthopaedic Centre
# Alex Ear,Nose n Throat Clinic
# Alex Eye Surgery Centre
# Alex General Surgery Clinic
# Alex Gynaecology Clinic
# Alex I-Care Clinic
# Alex Rehabilitation Med Clinic

#update the filter
SOC_Links<-filter(SOC_Links, center=="Alex I-Care Clinic") 
SOC_Nodes<-filter(SOC_Nodes, center=="Alex I-Care Clinic")

SOC_Links = as.data.frame(SOC_Links)
SOC_Nodes = as.data.frame(SOC_Nodes)


# SOC_Links <- SOC_Links[ -c(4) ] #drop the 4th column
# SOC_Nodes <- SOC_Nodes[ -c(4) ] #drop the 4th column

View(SOC_Links)
View(SOC_Nodes)

forceNetwork(Links = SOC_Links, Nodes = SOC_Nodes, Source = "source",
             colourScale = JS("d3.scaleOrdinal(d3.schemeCategory10);"),
             linkWidth = JS("function(d) { return Math.sqrt(d.value); }"),
             radiusCalculation = JS(" Math.sqrt(d.nodesize)+2"),
             Target = "target", Value = "value", Nodesize = "size", linkDistance = JS("function(d){return d.value * 8}"),
             NodeID = "name", Group = "group", height = 600, charge=-30,
                width = 800, fontSize = 14, opacity = 0.95, opacityNoHover = 0.9,
             arrows = TRUE, bounded = FALSE, legend = TRUE, zoom = TRUE)


