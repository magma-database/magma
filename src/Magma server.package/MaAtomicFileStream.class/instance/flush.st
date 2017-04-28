filestream api
flush
	"API compatibility with StandardFileStream.  Write all of my writers and force an unconditional flush of each file."
	self maCommit.
	guard critical: [ self physicalFlush ]