initialize-release
filePool: aMaFileStreamPool
	super filePool: aMaFileStreamPool.
	oidIndexes do: [ : each | each filePool: aMaFileStreamPool ].
	keyIndexes do: [ : each | each filePool: aMaFileStreamPool ]