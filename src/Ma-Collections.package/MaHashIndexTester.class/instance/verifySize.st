private tests
verifySize
	| size count |
	self assert: (size := self index size) = predictedSize.
	count := 0.
	self index
		entriesFromIndex: 1
		do:
			[ : rec : bax : level | count := count + 1 ]
		until:
			[ : rec : bax : level | false ].
	self assert: size = count