test query cancel
testReleaseReader
	| collectionOid |
	self 
		remotePerform: #buildLargeMc
		in: 'client1'.
	collectionOid := self 
		remotePerform: #startLuxuryQuery
		in: 'client2'.
	self 
		remotePerform: #verifyQueryRunning:
		with: collectionOid
		in: 'server'.
	self 
		remotePerform: #releaseLuxuryQuery
		in: 'client2'.
	self 
		remotePerform: #verifyQueryCanceled:
		with: collectionOid
		in: 'server'