tests
runKeyInsertionIntoBroadRecords
	"A 'broad' record is one whose key range is greater than its
	numberOfEntries, thus it cannot hold duplicate keys.
	This test adds keys in an order that requires the index to
	re-sequence keys across multiple broad records."

	self
		addKeys: #(500 450 470 550 400);
		verifyIndex;
		removeKey: 450;
		verifyIndex;
		addKey: 471;
		verifyIndex.
	25 timesRepeat: [ self addKey: 470 ].
	self verifyIndex.
	25 timesRepeat: [ self addKey: 469 ].
	self verifyIndex.
	1
		to: 25
		do:
			[ :each |
			each even
				ifTrue:
					[ self
						removeKey: 469
						at: each // 2 ] ].
	self verifyIndex