test client identity-dict
updateIdentityDict
	"Replace all of the objects with new objects, to force them as proxies in the other client when it refreshes."
	| ids |
	clientSession refresh.
	ids := clientSession root at: #testPersistentObjectsInIdentityDict.
	clientSession commit:
		[ 1
			to: 1000
			do:
				[ : n | ids at: Object new put: nil ] ]