debugging
buffersMissingFromWholeWhere: aBlock
	"Answer whether I have all the object buffers needed to reconstitute my entire graph."
	^ Array streamContents:
		[ : stream | self
			buffersMissingFromWholeWhere: aBlock
			do: [ : eachOid : eachBuffer | stream nextPut: eachOid -> eachBuffer copyWithSameBuffer ] ]