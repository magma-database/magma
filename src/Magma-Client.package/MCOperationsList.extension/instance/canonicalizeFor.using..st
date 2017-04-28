*magma-client-private
canonicalizeFor: aMCVersion using: aMcModel 
	operations do:
		[ : each | each
			canonicalizeFor: aMCVersion
			using: aMcModel ]