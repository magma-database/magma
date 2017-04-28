test MagmaStat
testMagmaStat
	"- make sure no commit-conflict.
- verify value"
	self
		remotePerform: #createStat5And6ThenAdd7Locally
			in: 'client1' ;
		remotePerform: #validateStatAndSubtract10
			in: 'client2' ;
		remotePerform: #validateMergeStat
			in: 'client1' ;
		remotePerform: #validateStatAfterRefreshAndAbort
			in: 'client2'