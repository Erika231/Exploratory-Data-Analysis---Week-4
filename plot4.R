#Read the data
NEI <- readRDS("summarySCC_PM25.rds")
CCode <- readRDS("Source_Classification_Code.rds")

coalCCode <- CCode [grepl("Coal", CCode$Short.Name), ]
coalEmData <- NEI[NEI$SCC %in% coalCCode$SCC, ]

# Sum up emissions by year
coalEmYear <- aggregate(coalEmData$Emissions, 
                                 by=list(coalEmData$year), FUN=sum)
colnames(coalEmYear) <- c("year", "emissions")

# Plot 4
png(filename = "plot4.png")
plot(coalEmYear$year, coalEmYear$emissions, type = "o",
     xlab = "Year",
     ylab = "Total Emissions (tons)",
     main = "Coal Related Emissions of PM2.5 in US from 1999-2008")
dev.off()