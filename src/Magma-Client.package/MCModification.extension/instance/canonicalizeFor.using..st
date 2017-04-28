*magma-client-private
canonicalizeFor: aMCVersion using: aMcModel 
	obsoletion := aMcModel
		canonicalizedDefinition: obsoletion
		of: self.
	modification := aMcModel
		canonicalizedDefinition: modification
		of: self