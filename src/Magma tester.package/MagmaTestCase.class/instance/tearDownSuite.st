initialize-release
tearDownSuite
	self class isConductorImage ifTrue: 
		[ 
		#('server' "'server2'" ) do: 
			[ : each | 
			self 
				remotePerform: #assertNoMagmaCollectionIndexClass
				in: each ].
		super tearDownSuite ]