utilities
objectBuffersDo: oneArgBlock 
	MaOidCalculator firstUserObjectOid 
		to: self getNextOid
		do: 
			[ : eachOid | 
			| buffer |
			[ buffer := self bufferFor: eachOid.
			oneArgBlock value: buffer ] 
				on: MagmaInvalidOid
				do: [ : err |  ] ]