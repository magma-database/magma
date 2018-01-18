file-specific
delete

	self close.
	(FileDirectory forFileName: file name) deleteFileNamed: file name