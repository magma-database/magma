*magma client
canBrowseMcMethodVersions
	^ self selectedMethodReference
		ifNil: [ false ]
		ifNotNilDo:
			[ : methodReference | methodReference mcModel notNil ]