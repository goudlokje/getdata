library('data.table')

### 1 Load data

# The combined dataset
df <- data.frame()

features <- read.table('UCI HAR Dataset/features.txt', sep=' ', col.names=c('id','name'))
activity_labels <- read.table('UCI HAR Dataset/activity_labels.txt', sep=' ', col.names=c('id','activity_label'))

for (set in c('test', 'train')) {
	prefix_fn <- paste('UCI HAR Dataset/',set,'/',sep='')
	data_fn <- paste(prefix_fn, 'X_',set,'.txt', sep='')
	subjects_fn <- paste(prefix_fn, 'subject_',set,'.txt', sep='')
	activities_fn <- paste(prefix_fn, 'y_',set,'.txt', sep='')

	# Make sure to decrease the buffersize to prevent OOM's
	dataset <- read.fwf(data_fn, widths=seq(16,16,length.out=561), col.names=features$name,buffersize = 100)
	subjects <- read.table(subjects_fn, col.names='subject')
	activity <- read.table(activities_fn, col.names='activity')

	dataset <- cbind(dataset,subjects,activity)
	
	df <- rbind(df,dataset)
}

### 2 Subset the data

# meanFreq is also selected, I think that is correct behaviour
columns <- grep('mean|std', colnames(df), value=T, ignore.case=T)
columns <- c(columns, 'subject', 'activity')
df <- df[,columns]

### 3 Add pretty activity label

df <- merge(df, activity_labels, by.x = 'activity', by.y = 'id')
# Remove old ID column
df$activity <- NULL

### 4 already done at 1

### 5 
df <- data.table(df)
# FIXME does this even work?
tidy.df <- df[,lapply(.SD,mean),by=c('subject','activity_label')]

write.table(tidy.df, 'getdata_project_tidy_df.txt',row.name=FALSE)
