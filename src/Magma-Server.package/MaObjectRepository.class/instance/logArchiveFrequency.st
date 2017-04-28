backup / restore
logArchiveFrequency
	"Answer the frequency which commit.log files are closed and a new one started.  Commit log files are used to apply to a backup to bring it up to date."
	^ recoveryManager logArchiveFrequency