*ma base additions
filesDo: aBlock tempDir: aFileDirectory 
	"Value aBlock with each DirectoryEntryFile in the receiver, after extracting it to aFileDirectory.  aFileDirectory is deleted after all members are valued."
	[ self extractAllTo: aFileDirectory ] ensure: [ self close ].
	
	[ self members do: [ : each | aBlock value: (aFileDirectory entryAt: each localFileName) ] ] ensure: 
		[ self members do: [ : each | aFileDirectory deleteFileNamed: each localFileName ] ]