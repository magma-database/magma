test concurrency
verifyFifthElement
	| mc reader |
	mc := clientSession abort root at: 'testConcurrency_mc'.
	reader := mc where: [ : each | each key = 14 ].
	self assert: reader isEmpty.
	reader := mc where: [ : each | each key = 13 ].
	self assert: reader size = 1