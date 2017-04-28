test query cancel
startLuxuryQuery
	| mc collectionOid |
	clientSession refresh.
	mc := clientSession root at: #testReleaseReader.
	luxuryQueryReader := mc 
		where: 
			[ : reader | 
			(reader 
				read: #key
				from: 0
				to: 2500) | (reader 
					read: #value
					from: 0
					to: 2500) ]
		distinct: true
		sortBy: #key
		descending: false.
	self deny: (MaOidCalculator isOidForNewObject: (collectionOid := clientSession oidFor: luxuryQueryReader collection)).
	^ collectionOid