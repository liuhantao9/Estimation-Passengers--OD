
library(dplyr)
library(leaflet)

data <- read.csv("~/Desktop/sen_frame.csv")
data <- filter(data, id == 2 | id == 3 | id == 4)
#data <- filter(data, id == 5 | id == 7 | id == 8)
#data <- filter(data, id == 6 | id == 9 | id == 10)

colorData <- c("03/06/2018 10:51-11:36, 44 stops, UW Bothell to NE Campus Parkway", "03/06/2018 7:40-8:32, 44 stops, NE Campus Parkway to UW Bothell", "03/01/2018 11:03-11:51, 44 stops, NE Campus Parkway to UW Bothell")
#colorData <- c("11/04/2018 15:05-15:47, 36 stops, Sand Point Way to Northgate", "11/08/2018 15:05-15:33, 36 stops, Sand Point Way to Northgate", "11/08/2018 15:38-16:04, 19 Stops, Northgate to 45th St")
#colorData <- c("11/04/2018 16:55-17:21, 29 stops, 1st Ave N to NE Pacific st", "11/09/2018 18:40-19:26, 40 stops, Sand Point Way to Queen Anne Ave N", "11/09/2018 19:38-20:05, 29 stops, 1st Ave N to NE Pacific st")
pal <- colorFactor(c("white","white","white"), colorData)



leaflet(data = data) %>%
  addProviderTiles(providers$CartoDB.Positron) %>%  # Add default OpenStreetMap map tiles
  addCircles(lng = ~lng, lat = ~lat, layerId = ~id, radius = 50, fillColor = "green",
             weight = 0.0001, fillOpacity = 0.1, stroke = FALSE) %>%
  addLegend("bottomright", pal = pal, values = colorData, title = "$$$This trip is route 372", layerId = "colorLegend")

 
