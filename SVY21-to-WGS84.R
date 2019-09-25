library(rgdal)

data <- read.csv("")
x <- data$X.Addr
y <- data$Y.Addr
d <- data.frame(lon=x, lat= y)
coordinates(d) <- c("lon", "lat")

CRS.new <- CRS("+init=epsg:4326") #WGS84
proj4string(d) <- CRS("+init=epsg:3414") # SVY21

d.wgs84 <- spTransform(d, CRS.new)
d.wgs84 <- as.data.frame(d.wgs84)
data <- cbind(d.wgs84, data)