actions
write: aMaObjectBuffer index: aBoolean 
	"write a single object encapsulated by aMaObjectBuffer."
	| filePosition |
	filePosition := aBoolean 
		ifTrue: 
			[ aMaObjectBuffer preWriteAdjustmentFrom: nil.
			self 
				index: aMaObjectBuffer oid
				at: file size ]
		ifFalse: 
			[ | pos |
			pos := self filePointerForOid: aMaObjectBuffer oid.
			self 
				recordSampleAt: pos
				do: 
					[ : existingBuffer | 
					aMaObjectBuffer preWriteAdjustmentFrom: existingBuffer.
					existingBuffer physicalSize = aMaObjectBuffer physicalSize 
						ifTrue: [ pos ]
						ifFalse: 
							[ self 
								index: aMaObjectBuffer oid
								at: file size ] ] ].
	self 
		write: aMaObjectBuffer
		at: filePosition