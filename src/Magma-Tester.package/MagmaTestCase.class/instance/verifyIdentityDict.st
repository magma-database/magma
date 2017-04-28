test client identity-dict
verifyIdentityDict
	"Now that client2 has updated them all, we should have all proxies in our IdentityDictionary."
	| idd |
	clientSession refresh.
	idd := clientSession root at: #testPersistentObjectsInIdentityDict.
	"Unfortunately, Rehash is required before using id-Dictionary's with Magma because the objects were originally put in by their proxy ."
	idd rehash.
	"Now verify the same after bulkBecome..."
	"	clientSession bulkBecomeProxies."
	idd keysDo:
		[ : each | self assert: (idd includesKey: each) ]