framework
versionWithInfo: aVersionInfo ifAbsent: errorBlock
	^ self mcModel
		versionWithInfo: aVersionInfo
		ifAbsent: errorBlock