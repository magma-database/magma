test client identity-dict
verifyIdentityDict
	"Now that client2 has updated them all, we should have all proxies in our IdentityDictionary."
	| idd |
	clientSession refresh.
	idd := clientSession root at: #testPersistentObjectsInIdentityDict.
	idd keysDo:
		[ : each | self
			 deny: each maIsMutatingProxy ;
			 assert: (idd includesKey: each) ].
	"Now verify the same after bulkBecome..."
	clientSession bulkBecomeProxies.
	idd keysDo:
		[ : each | self
			 deny: each maIsMutatingProxy ;
			 assert: (idd includesKey: each) ]