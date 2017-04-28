test client identity-dict
testPersistentObjectsInIdentityDict
	"I sense that, now that we've removed MagmaMutatingProxy>>#identityHash, whether we can actually have Magma objects in a IdentityDictionary."
	self
		
		remotePerform: #setUpTestPersistentObjectsInIdentityDict
		in: 'client1' ;
		
		remotePerform: #updateIdentityDict
		in: 'client2' ;
		
		remotePerform: #verifyIdentityDict
		in: 'client1'