get_data <- function() {
    file_name <- "household_power_consumption"
    txt_file_name <- paste(file_name, "txt", sep=".")
    if (!file.exists(txt_file_name)) {
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        zip_file_name <- paste(file_name, "zip", sep=".")
        download.file(url, destfile=zip_file_name, method="curl")
        unzip(zip_file_name)
        file.remove(zip_file_name)    
    }
    data <- read.csv(txt_file_name, sep=";",
                  colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                  na.strings=c("NA", "", "?"))
    data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    data$Date <- strptime(data$Date, "%d/%m/%Y")
    return(data)
}