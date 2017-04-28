private
iconNamed: selectorSymbol ifAbsentPutFromString: aString 
	^ self 
		iconNamed: selectorSymbol
		ifAbsentPutFromBytes: (Base64MimeConverter mimeDecodeToBytes: aString readStream)