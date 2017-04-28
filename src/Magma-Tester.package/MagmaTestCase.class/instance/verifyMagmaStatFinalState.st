test MagmaStat
verifyMagmaStatFinalState
	| stat |
	stat := self statFixture.
	self
		 assert: (stat equals: (self newStat: #(5 6 -10 1 2 3 4 7 ))) ;
		 assert: stat deltaCount = 0 ;
		 assert: stat deltaSum = 0.0 ;
		 assertTypes: stat