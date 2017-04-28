utilities
objectBuffersDo: oneArgBlock 
	FirstUserObjectOid 
		to: self getNextOid
		do: 
			[ : eachOid | 
			| buffer |
			[ buffer := self bufferFor: eachOid.
			oneArgBlock value: buffer ] 
				on: MagmaInvalidOid
				do: [ : err |  ] ]