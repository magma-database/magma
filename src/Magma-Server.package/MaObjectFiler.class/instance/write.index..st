actions
write: aMaObjectBuffer index: aBoolean 
	"write a single object encapsulated by aMaObjectBuffer."
	| filePosition |
	filePosition := aBoolean
		ifTrue:
			[ self
				
				prewriteAdjustmentTo: aMaObjectBuffer
				from: nil ;
				
				index: aMaObjectBuffer oid
				at: file size ]
		ifFalse:
			[ | pos |
			pos := self filePointerForOid: aMaObjectBuffer oid.
			aMaObjectBuffer canGrow
				ifTrue:
					[ self
						recordSampleAt: pos
						do:
							[ : existingBuffer | self
								prewriteAdjustmentTo: aMaObjectBuffer
								from: existingBuffer.
							existingBuffer physicalSize = aMaObjectBuffer physicalSize
								ifTrue: [ pos ]
								ifFalse:
									[ self
										index: aMaObjectBuffer oid
										at: file size ] ] ]
				ifFalse: [ pos ] ].
	self
		write: aMaObjectBuffer
		at: filePosition