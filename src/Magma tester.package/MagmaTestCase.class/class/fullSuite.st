create suite
fullSuite
	^ MagmaCollectionTester suite
		addTestsFirst: self suite tests ;
"		addTests: MagmaUtilitiesTester suite tests ;"
		yourself