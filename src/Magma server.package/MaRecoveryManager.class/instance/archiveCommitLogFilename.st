file
archiveCommitLogFilename
	"Answer the proper name for the archive commits file to become a recovery file.  The filename is commits.123.log, where 123 is commitNumber of the last CommitRecord in the file."
	^ String streamContents: 
		[ : stream | 
		stream
			maPrint: self class commitLogFilename ;
			maPrint: $. ;
			maPrint: commitNumber ;
			maPrint: $. ;
			maPrint: self class commitLogExtension ]