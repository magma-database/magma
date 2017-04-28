*magma client
browseMethodVersionsInMc
	"Open a browser on all versions of this method available in the MC repository for this package."
	self selectedMethodReference
		ifNil: [ UIManager inform: 'No method selected' ]
		ifNotNilDo:
			[ : methodReference | methodReference mcModel
				ifNil: [ UIManager inform: 'No Magma-based repository for ' , methodReference packageInfo packageName ]
				ifNotNilDo:
					[ : mcModel | (MCPatch operations: methodReference mcPatchOperations) browse ] ]