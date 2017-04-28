test MagmaStat
validateStatAndSubtract10
	"We never crossed a transaction boundary, so we're still just 5 6 7."
	| stat |
	clientSession begin.
	stat := self statFixture.
	self
		 assert: (stat equals: (self newStat: #(5 6 ))) ;
		 assert: stat deltaSum = 0.0 ;
		 assert: stat deltaCount = 0 ;
		 assertTypes: stat.
	stat addValue: -10.0.
	self
		 assert: (stat equals: (self newStat: #(5 6 -10 ))) ;
		 assert: stat deltaSum = -10.0 ;
		 assert: stat deltaCount = 1 ;
		 assertTypes: stat.
	clientSession commit