versions
versionWithInfo: aVersionInfo ifAbsent: errorBlock 
	^ objects
		at: aVersionInfo id
		ifPresent: [ : ver | ver ]
		ifAbsent: errorBlock