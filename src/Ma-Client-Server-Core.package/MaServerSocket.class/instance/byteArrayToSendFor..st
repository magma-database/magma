private
byteArrayToSendFor: aByteArray 
	^ aByteArray size > self compressThreshold  
		ifTrue: 
			[ | compressed |
			compressed := aByteArray lzCompressed.
			compressed size < aByteArray size 
				ifTrue: [ compressed ]
				ifFalse: [ aByteArray ] ]
		ifFalse: [ aByteArray ]