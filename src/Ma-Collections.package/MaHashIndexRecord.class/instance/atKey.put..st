building
atKey: keyInteger put: valueInteger 
	"The receiver has been verified for some available slot for keyInteger."
	self 
		eligibleByteArrayIndexesFor: keyInteger
		reverseDo: 
			[ : index | 
			(self hasSlotAvailableAtByteArrayIndex: index) ifTrue: 
				[ self 
					keyAtByteArrayIndex: index
					put: keyInteger.
				self 
					valueAtByteArrayIndex: index
					put: valueInteger.
				self occupySlotAtByteArrayIndex: index.
				^ index ] ].
	MaSoftwareError signal: 'I should have been verified for an available slot.'