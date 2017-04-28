capture context
writeImageInformationTo: aStream

	aStream
		cr; cr;
		nextPutAll: 'Image Details:'.
	self
		writeEntry: 'version'
		value: SystemVersion current version
		to: aStream.
	self
		writeEntry: 'lastUpdate'
		value: SystemVersion current highestUpdate printString
		to: aStream.
	self
		writeEntry: 'showStatusViaCursor'
		value: MagmaPreferences showStatusViaCursor
		to: aStream.
