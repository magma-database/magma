initialize
createRepository
	MagmaRepositoryController 
		create: self dbName, self port asString
		root: (Dictionary new
				at: #collection
					put: self newFixture ;
				yourself)