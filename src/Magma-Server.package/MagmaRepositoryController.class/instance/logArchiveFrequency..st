backup / restore
logArchiveFrequency: aDuration 
	"Override the default frequency which commit.log files are closed and a new one started.  Commit log files are used to apply to a backup to bring it up to date.

	Example:  myRepositoryController logArchiveFrequency: 15 minutes."
	repository logArchiveFrequency: aDuration