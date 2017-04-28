recovery
captureBeforeImages
	"Capture a current description of the actual files in the places where we intend to change them.  We capture whether a file is new, whether it will be extended in length, and what file positions will be overwritten and what contents are there presently."
	self openDbFilesDo: 
		[ : eachAtomicFileStream : eachFileId | 
		recoveryManager 
			writeRollbackRecordsFor: eachAtomicFileStream
			fileId: eachFileId ].
	recoveryManager flush