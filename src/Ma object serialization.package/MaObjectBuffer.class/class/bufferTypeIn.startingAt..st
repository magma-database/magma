accessing
bufferTypeIn: aByteArray startingAt: startPositionOfObjectBuffer
	"The bufferType is stored in the 4 low-order bits of the controlFields."

	^ (self 
		controlFieldsIn: aByteArray
		startingAt: startPositionOfObjectBuffer) bitAnd: 2r00001111