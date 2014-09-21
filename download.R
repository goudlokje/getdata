if (! file.exists('UCI HAR Dataset')) {
	zip.file <- 'dataset.zip'
	download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', zip.file, method='curl')
	unzip(zip.file)
}
