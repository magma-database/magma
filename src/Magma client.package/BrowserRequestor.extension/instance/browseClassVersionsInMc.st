*magma client
browseClassVersionsInMc
	"Open a browser on all versions of this class available in the MC repository for this package."
	self getClass
		ifNil: [ UIManager inform: 'No class selected' ]
		ifNotNilDo:
			[ : theClass | theClass mcModel
				ifNil: [ UIManager inform: 'No Magma-based repository for ' , theClass packageInfo packageName ]
				ifNotNilDo:
					[ : mcModel | (MCPatch operations: theClass mcPatchOperations) browse ] ]