*ma object serialization
maAsStorageObject 
	^ DiskProxy 
		global: #TTFontDescription selector: #descriptionNamed:
		args: { self name }