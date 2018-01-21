*ma-core
defaultMaxMemory
	"Images can be up to 1GB (512MB on Windows) when the -memory parameter is not specified."
	^ Smalltalk vm isSpur
		ifTrue: [ 3800000000 ]
		ifFalse:
			[ Smalltalk platformName = 'Win32'
				ifTrue: [ 500000000 ]
				ifFalse: [ 1000000000 ] ]