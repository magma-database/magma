*magma client
browseMcClassOrigin
	"Open a Monticello version browser on the earliest version available in the repository known to contain this version."
	self getClass
		ifNil: [ UIManager inform: 'No method selected' ]
		ifNotNilDo:
			[ : selectedClass | selectedClass mcModel
				ifNil: [ UIManager inform: 'No Magma-based repository for ' , selectedClass packageInfo packageName ]
				ifNotNilDo:
					[ : mcModel | (mcModel originOf: selectedClass asClassDefinition)
						ifNil: [ UIManager inform: selectedClass asString , ' was not found in any Magma-based MC repository.' ]
						ifNotNilDo:
							[ : version | version open ] ] ]