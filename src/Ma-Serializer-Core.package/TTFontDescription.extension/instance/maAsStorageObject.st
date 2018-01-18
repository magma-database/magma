*ma-serializer-core
maAsStorageObject 
	^ DiskProxy 
		global: #TTFontDescription selector: #descriptionNamed:
		args: { self name }