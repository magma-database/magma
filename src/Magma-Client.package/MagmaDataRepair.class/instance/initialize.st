initialize-release
initialize
	super initialize.
	doBlock := startBlock := [].
	strongReferences := IdentitySet new