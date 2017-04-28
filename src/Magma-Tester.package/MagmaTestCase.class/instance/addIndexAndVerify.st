test transactions
addIndexAndVerify
	| mc |
	self assert: original34990 key = 34990.
	mc := clientSession root at: 'BuildIndexCommitConflictTest_mc'.
	mc addIndex: (MaIntegerIndex attribute: #key).
	clientSession commit.
	"addIndex caused many transaction-boundary crossings."
	self assert: original34990 key = 34991.
	self assert: (mc where: [ : each | each key equals: 34990 ]) size = 0.
	self assert: (mc where: [ : each | each key equals: 34991 ]) size = 1