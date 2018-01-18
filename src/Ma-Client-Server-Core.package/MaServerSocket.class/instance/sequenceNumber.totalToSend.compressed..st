private
sequenceNumber: sequenceNumber totalToSend: totalToSend compressed: compressed 
	| header |
	header := ByteArray new: self headerSize.
	header
		maUint: 32
		at: 0
		put:
			(self
				setCompressedBit: compressed
				for: totalToSend).
	self isUdp ifFalse:
		[ header
			maUint: 32
			at: 4
			put: sequenceNumber ].
	^ header