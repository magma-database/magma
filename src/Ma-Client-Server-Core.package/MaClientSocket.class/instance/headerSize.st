private
headerSize
	"First 4 bytes:  size of entire message (including header).
	Bytes 5-8:  sequenceNumber of this request or response."
	^ self isUdp ifTrue: [4] ifFalse: [8]