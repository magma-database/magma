private
physicalSize: anInteger 
	anInteger > (1 bitShift: 32 "self class sizeOfPhysicalSizeField*4") ifTrue: [ MagmaSoftwareError signal: 'Must not exceed single buffer limit.' ].
	self maMarked: #sizeOfPhysicalSizeField.
	byteArray
		maUint: 32 "self class sizeOfPhysicalSizeField*4"
		at: self bufferPositionOfPhysicalSize
		put: anInteger