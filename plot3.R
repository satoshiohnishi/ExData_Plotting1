# Load library
library(lattice)

# Read electric consumption data 
df <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt"
              , header = TRUE, sep = ";", na.strings = "?")

# Convert date and time as Date
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

# only 2007-02-01 and 2007-02-02 data
# Subset only 2007-02-01 and 2007-02-02 data
df_sub <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02", ]

# Fill missing values with 0
df_sub[is.na(df_sub)] <- 0

# make 'datetime' column(Date and Time) as POSIXct
df_sub$datetime <- as.POSIXct(paste(df_sub$Date, df_sub$Time), format = "%Y-%m-%d %H:%M:%S")

# Set locale to English
Sys.setlocale("LC_TIME", "C")

# make  line plot x=Date, y="Sub_metering_1",Sub_metering_2",Sub_metering_3"  and x-axis interval is 1 day and convert to Weekday(English)
xyplot(Sub_metering_1 + Sub_metering_2 + Sub_metering_3 ~ datetime,
       data = df_sub, type = "l",
       xlab = "Date", ylab = "Energy sub metering",
       main = "Energy sub metering 1, 2, 3 on 2007-02-01 and 2007-02-02",
       scales = list(x = list(at = seq(from = as.POSIXct("2007-02-01"), to = as.POSIXct("2007-02-03"), 
                                       by = "day"), format = "%a"), y = list(rot = 0)), col = c("black", "red", "blue"))

# save plot
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
