instance creation
selector: aSymbol 
	^ self dataAccessBlock: [ : object | object perform: aSymbol ]