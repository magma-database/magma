actions
buffersDo: oneArgBlock
	"Value oneArgBlock with each ObjectBuffer in the
	receiver.  There is one ObjectBuffer for each object in the graph that
	the receiver represents."

	| preMadeBuffers |
	preMadeBuffers := self newPremadeBuffers.
	self bufferPositionsDo:
		[ :eachPosition | | buffer |
		buffer := (preMadeBuffers at: (self bufferTypeAt: eachPosition)).
		buffer
			byteArray: byteArray;
			startPos: eachPosition.
		oneArgBlock value: buffer ]