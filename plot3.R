#Read the data
NEI <- readRDS("summarySCC_PM25.rds")


# Emission of Baltimore City by "type"
baltData <- subset(NEI, NEI$fips=="24510")
baltTypeYear <- aggregate(baltData$Emissions, by=list(baltData$type, baltData$year), FUN=sum)
colnames(baltTypeYear) <- c("Type", "Year", "Emissions")

#Plot with ggplot2
library(ggplot2)
png(filename = "plot3.png")
qplot(Year, Emissions, data = baltTypeYear, color = Type, geom = "line") +
  ggtitle("Total Emissions of PM2.5 in Baltimore City By pollutant type") + 
  ylab("Total Emissions (tons)") + 
  xlab("Year") 
dev.off()