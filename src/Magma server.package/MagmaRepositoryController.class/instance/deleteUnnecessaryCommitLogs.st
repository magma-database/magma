backup / restore
deleteUnnecessaryCommitLogs
	"Delete all commit log files from my 'commits' subdirectory that have already been written to my repository files and, therefore, are no longer needed by this repository.  This is not performed automatically because the files might be needed for one or more warm backups."
	repository deleteUnnecessaryCommitLogs