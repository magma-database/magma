accessing
localName
	^ (FileDirectory on: (FileDirectory dirPathFor: filename)) localNameFor: filename