private
graphFrom: oidInteger do: oneArgBlock using: aMaReadStrategy 
	| buffer indexPosition |
	(MaOidCalculator isOidForUserObject: oidInteger) ifFalse: [ ^ self ].
	indexPosition := MaOidCalculator indexPositionForOid: oidInteger.
	(oidsVisited 
		at: indexPosition
		ifAbsent: [ 0 ]) = 0 ifFalse: [ ^ self ].
	objectCount := objectCount + 1.
	oidsVisited 
		at: indexPosition
		put: oidInteger.
	repositoryController requestCritical: 
		[ buffer := self repository filer 
			appendObject: oidInteger
			into: graphBuffer ].
	oneArgBlock value: buffer.
	buffer 
		graphDo: oneArgBlock
		using: aMaReadStrategy
		for: self.
	graphBuffer decreaseBufferSizeBy: buffer physicalSize