#Read the data
NEI <- readRDS("summarySCC_PM25.rds")

sum.year <- aggregate(NEI$Emissions, by=list(year=NEI$year), FUN=sum)


#Plot 1
png(filename = "plot1.png")
plot(sum.year$year, sum.year$x, type = "l", 
     main = "Total Emissions of PM2.5 in Baltimore City",
     ylab = "Total emissions of PM2.5 (tons)",
     xlab = "Year")
dev.off()