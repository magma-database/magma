accessing
byteArray: aByteArray

	self graphBuffer byteArray: aByteArray.
	preMadeObjectBuffers do: [ :each | each byteArray: aByteArray ]
