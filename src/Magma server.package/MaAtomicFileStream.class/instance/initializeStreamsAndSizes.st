initialize-release
initializeStreamsAndSizes
	"Determine which streams are available in the current directory and their sizes."
	| fd baseName extension matchingEntries |
	fd := FileDirectory on: (FileDirectory dirPathFor: filename).
	baseName := self baseName.
	extension := self extension.
	"Gather up the entries for my filename and extension."
	matchingEntries := fd entries select: 
		[ : eachEntry | 
		| eachNameVersionAndExtension |
		eachNameVersionAndExtension := fd splitNameVersionExtensionFor: eachEntry name.
		eachNameVersionAndExtension first = baseName and: [ eachNameVersionAndExtension last = extension ] ].
	"Then sort them by the file-number (second dot-delimited field)"
	matchingEntries := matchingEntries asSortedCollection: 
		[ : a : b | 
		| nameVersionAndExtensionA nameVersionAndExtensionB |
		nameVersionAndExtensionA := fd splitNameVersionExtensionFor: a name.
		nameVersionAndExtensionB := fd splitNameVersionExtensionFor: b name.
		(nameVersionAndExtensionA at: 2) < (nameVersionAndExtensionB at: 2) ].
	"Now load my fileStreams and sizes with these correctly-ordered entries."
	matchingEntries do: 
		[ : eachEntry | 
		| physicalStream |
		physicalStream := StandardFileStream readOnlyFileNamed: (fd fullNameFor: eachEntry name).
		physicalStream closed ifTrue: [ MagmaEnvironmentError signal: 'file did not open for read-only' ].
		fileStreams add: physicalStream.
		physicalStream
			close ;
			readWrite.
		sizes add: eachEntry fileSize ]