more icons
methodSourceForIcon: aForm named: selectorSymbol 
	| formStream base64Stream |
	formStream := RWBinaryOrTextStream on: ByteArray new.
	PNGReadWriter 
		putForm: aForm
		onStream: formStream.
	base64Stream := Base64MimeConverter mimeEncode: formStream.
	^ String streamContents: 
		[ : stream | 
		stream
			nextPutAll: selectorSymbol ;
			nextPutAll: '
	^ self 
		iconNamed: #' ;
			nextPutAll: selectorSymbol ;
			nextPutAll: '
		ifAbsentPutFromString: ' ;
			nextPut: $' ;
			nextPutAll: base64Stream contents ;
			nextPut: $' ]