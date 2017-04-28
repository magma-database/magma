test stale collections
readMagmaCollection

	clientSession abort.
	localRoot
		at: 'testStaleCollections'
		put: (clientSession root at: 'testStaleCollections')