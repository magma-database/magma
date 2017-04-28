test MagmaStat
validateStatAfterRefreshAndAbort
	"Refreshing a MagmaStat behaves as expected:  local changes are kept, remote changes are merged.  So, the (1 2 3 4) should be 'integrated' after the refresh."
	| stat |
	stat := self statFixture.
	self
		 assert: (stat equals: (self newStat: #(5 6 -10 ))) ;
		 assert: stat deltaCount = 0 ;
		 assert: stat deltaSum = 0.0 ;
		 assertTypes: stat.
	self statFixture
		 addValue: -13 ;
		 addValue: -14.
	self
		 assert: (self statFixture equals: (self newStat: #(5 6 -10 -13 -14 ))) ;
		 assert: stat deltaCount = 2 ;
		 assert: stat deltaSum = -27.0 ;
		 assertTypes: stat.
	clientSession refresh.
	self
		 assert: (stat equals: (self newStat: #(5 6 -10 1 2 3 4 7 -13 -14 ))) ;
		 assert: stat deltaCount = 2 ;
		 assert: stat deltaSum = -27.0 ;
		 assertTypes: stat.
	clientSession abort.
	self verifyMagmaStatFinalState.
	statFixture := nil