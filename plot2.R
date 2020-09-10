#Read the data
NEI <- readRDS("summarySCC_PM25.rds")


# Emissions of Baltimore City
baltData <- subset(NEI, NEI$fips=="24510")
baltDataYear <- aggregate(baltData$Emissions, by=list(baltData$year), 
                                 FUN=sum)
#Plot 2
png(filename = "plot2.png")
plot(baltDataYear$Group.1, baltDataYear$x, type = "l", 
     main = "Total Emissions of PM2.5 in Baltimore City", xlab = "year", 
     ylab = "Total Emissions (tons)")
dev.off()