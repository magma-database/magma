*ma-core
maHashMessage: aStringOrByteArray from: startPos to: stopPos
	"Hash the given message using the Secure Hash Algorithm."

	^ self
		maHashStream: 
			((ReadStream on: aStringOrByteArray asByteArray)
				position: startPos-1 ;
				yourself)
		to: stopPos