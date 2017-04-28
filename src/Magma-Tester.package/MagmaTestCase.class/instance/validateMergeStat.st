test MagmaStat
validateMergeStat
	| stat |
	stat := self statFixture.
	self
		assert: (stat equals: (self newStat: #(5 6 7 ))) ;
		assert: stat deltaCount = 1 ;
		assert: stat deltaSum = 7.0 ;
		assertTypes: stat..
	clientSession commitAndBegin.
	self
		assert: (stat equals: (self newStat: #(5 6 -10 7))) ;
		assert: stat deltaCount = 0 ;
		assert: stat deltaSum = 0.0 ;
		assertTypes: stat.
	stat merge: (self newStat: #(1 2 3 4 )).
	self
		assert: (stat equals: (self newStat: #(5 6 "7 is last value added" -10 1 2 3 4 7))) ;
		assert: stat deltaCount = 4 ;
		assert: stat deltaSum = 10.0 ;
		assertTypes: stat.
	clientSession commit.
	self
		assert: (stat equals: (self newStat: #(5 6 "7 is last value added" -10 1 2 3 4 7))) ;
		assert: stat deltaCount = 0 ;
		assert: stat deltaSum = 0.0 ;
		assertTypes: stat.
	"Later want to create a new statFixture rather than keep using this one."
	statFixture := nil