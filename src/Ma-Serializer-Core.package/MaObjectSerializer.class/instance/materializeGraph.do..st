materializing
materializeGraph: aByteArray do: twoArgBlock
	"Answer a fully-formed object from aByteArray of aMaSerializedGraphBuffer.  If buffers are missing to complete the full-graph, I will substitute with proxy's based on the block specified by toCreateProxies:."

	"Guard against stepping on my own buffers if I'm busy serializing or materializing already."
	^ amBusy
		ifTrue:
			[ self copyWithNewBuffer
				byteArray: aByteArray;
				materializeGraphDo: twoArgBlock ]
		ifFalse:
			[ self
				byteArray: aByteArray;
				materializeGraphDo: twoArgBlock ]