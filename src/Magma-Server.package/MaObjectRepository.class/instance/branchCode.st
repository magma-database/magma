accessing
branchCode
	"The branchCode is a randomly-generated number used to prevent accidentally applying the wrong commit-logs to a repository.  When performing a forward recovery, each CommitLogRecord's #branchCode must match mine.  Every time a commitRestore is performed, this branchCode is updated to a new number."
	^ filer branchCode