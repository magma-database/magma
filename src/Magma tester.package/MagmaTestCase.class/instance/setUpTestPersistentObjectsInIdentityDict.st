test client identity-dict
setUpTestPersistentObjectsInIdentityDict
	clientSession commit:
		[ clientSession root
			at: #testPersistentObjectsInIdentityDict
			put: IdentityDictionary new ]