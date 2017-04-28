create suite
buildSuite
	| suite |
	suite := super buildSuite.
	#(#testAddIndexAndObjectsSimultaneously #testConcurrency #testEmptyMagmaArray #testKeywordIndex #testMagmaArray #testMagmaDictionary #testMagmaHashTable #testMagmaSet #testMagmaSolHashTable #testMajorFunctions #testMultiKeywordMatching #testNonPersistentEmpty #testNonPersistentPopulated #testNonPersistentReader #testNonPersistentSolHashTables #testNpIntegrationForMagmaArrays #testNpIntegrationForMagmaCollections #testNpIntegrationForReaders #testPersistentEmpty #testPersistentPopulated #testPersistentReader #testPersistentResultSet #testPreallocatedMagmaDictionary #testReleaseReader #testStaleCollections ) do:
		[ : eachSelector | suite tests add:
			(suite tests remove:
				(suite tests detect:
					[ : each | each selector = eachSelector ])) ].
	^ suite