*magma client
browseMcMethodOrigin
	"Open a Monticello version browser on the earliest version available in the repository known to contain this version."
	self selectedMethodReference
		ifNil: [ UIManager inform: 'No method selected' ]
		ifNotNilDo:
			[ : methodReference | methodReference mcModel
				ifNil: [ UIManager inform: 'No Magma-based repository for ' , methodReference packageInfo packageName ]
				ifNotNilDo:
					[ : mcModel | (mcModel originOf: methodReference asMethodDefinition)
						ifNil: [ UIManager inform: methodReference asString , ' was not found in any Magma-based MC repository.' ]
						ifNotNilDo:
							[ : version | version open ] ] ]