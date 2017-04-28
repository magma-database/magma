*magma client
canBrowseMcClassVersions
	^ self getClass
		ifNil: [ false ]
		ifNotNilDo:
			[ : class | class mcModel notNil ]