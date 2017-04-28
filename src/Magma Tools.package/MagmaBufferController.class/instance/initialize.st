initializing
initialize
	super initialize.
	bufferFacades := Dictionary new.
	commitRecords := Dictionary new.
	commitLogSerializer := MagmaSession newCommitLogSerializer