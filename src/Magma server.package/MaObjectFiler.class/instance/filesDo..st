recovery
filesDo: twoArgBlock

	twoArgBlock
		value: file 
		value: MaApplyRecord objectsFileId.
	filePositionIndex filesDo:
		[ : each |
		twoArgBlock
			value: each
			value: MaApplyRecord filePositionsFileId ]