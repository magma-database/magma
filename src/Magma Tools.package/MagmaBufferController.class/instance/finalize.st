access
finalize
	commitRecords := commitRecords reject: [ : each | each isNil ].
	bufferFacades := bufferFacades reject: [ : each | each isNil ]