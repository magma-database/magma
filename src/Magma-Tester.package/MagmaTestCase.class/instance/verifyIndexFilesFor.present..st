test major functions
verifyIndexFilesFor: collectionOid present: aBoolean 
	| description filename fact parts |
	description := MagmaIndexDescription
		attribute: #yourself
		keySize: 64
		recordSize: 8.
	filename := (magmaConsole controller repository collectionManagerFor: collectionOid)
		filenameFor: 'oids'
		of: description.
	parts := self environmentDirectory splitNameVersionExtensionFor: filename.
	filename := parts first , '.1.' , parts last.
	fact := magmaConsole controller repository directory fileExists: filename.
	aBoolean
		ifTrue: [ self assert: fact ]
		ifFalse: [ self deny: fact ]