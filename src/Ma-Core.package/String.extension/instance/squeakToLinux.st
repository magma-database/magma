*ma-core
squeakToLinux
	^ self
		copyReplaceAll: (Character value: 13) asString
		with: (Character value: 10) asString