# Load library
library(lattice)

# Read electric consumption data
df <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert date and time as Date
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

# only 2007-02-01 and 2007-02-02 data
# Subset only 2007-02-01 and 2007-02-02 data
df_sub <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02", ]

# Fill missing values with 0
df_sub[is.na(df_sub)] <- 0

# make histogram
hist(df_sub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# save plot
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()

