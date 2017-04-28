*magma-client
newObjectBuffersMissingFromWhole
	^ Array streamContents:
		[ : stream | self
			buffersMissingFromWholeWhere:
				[ : oid | MaOidCalculator isOidForNewObject: oid ]
			do:
				[ : referencedOid : referencingBuffer | stream nextPut: referencedOid -> referencingBuffer copyWithSameBuffer ] ]