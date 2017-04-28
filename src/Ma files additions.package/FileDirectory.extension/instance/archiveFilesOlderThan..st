*ma files additions
archiveFilesOlderThan: aDuration 
	| cutoff |
	self halt.
	cutoff := DateAndTime now - aDuration.
	self 
		archiveFilesMatching: [ : each | each modificationDateAndTime < cutoff ]
		toZipFileNamed: 'prior_to_' , cutoff asString , '.zip'