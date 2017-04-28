test MagmaStat
createStat5And6ThenAdd7Locally
	| stat |
	stat := MagmaStat new
		 addValue: 5 ;
		 addValue: 6 ;
		 yourself.
	self
		 assert: (stat equals: (self newStat: #(5 6 ))) ;
		 assertTypes: stat.
	clientSession commit:
		[ clientSession root
			at: #testMagmaStat
			put: stat ].
	self
		 assert: (stat equals: (self newStat: #(5 6 ))) ;
		 assert: stat deltaSum = 0 ;
		 assert: stat deltaCount = 0.0 ;
		 assertTypes: stat.
	stat addValue: 7.
	self
		 assert: (stat equals: (self newStat: #(5 6 7 ))) ;
		 assert: stat deltaSum = 7.0 ;
		 assert: stat deltaCount = 1 ;
		 assertTypes: stat.
	clientSession begin.
	self
		 assert: (stat equals: (self newStat: #(5 6 7 ))) ;
		 assert: stat deltaSum = 7.0 ;
		 assert: stat deltaCount = 1 ;
		 assertTypes: stat