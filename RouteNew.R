library(leaflet)
library(sp)
library(data.table)
library(googleway) 
library(dplyr)

data <- read.csv("~/Desktop/trip_detail_new.csv")

data9 <- filter(data, trip_id == 9)
lst_lines9 <- Lines(Line(select(data9, lng, lat)), ID = 2)

data4 <- filter(data, trip_id == 4)
lst_lines4 <- Lines(Line(select(data4, lng, lat)), ID = 2)

data5 <- filter(data, trip_id == 5)
lst_lines5 <- Lines(Line(select(data5, lng, lat)), ID = 2)

colorData <- c("67", "372", "32")
pal <-  colorFactor(c("red", "green", "blue"), colorData)

## can now plot the spatial lines
leaflet() %>%
  addTiles()  %>%
  addPolylines(lst_lines9, lng = data9$lng, lat = data9$lat, opacity = 1, weight = 8, color = "red") %>%
  addPolylines(lst_lines4, lng = data4$lng, lat = data4$lat, opacity = 1, weight = 8, color = "green") %>%
  addPolylines(lst_lines5, lng = data5$lng, lat = data5$lat, opacity = 1, weight = 8, color = "blue") 