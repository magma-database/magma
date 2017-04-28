private tests
verifyMidIndexAccess
	| size |
	(size:=self index size)
		to: 1
		by: (size//100 max: 1) negated
		do:
			[ : n | | count |
			count := 0.
			self index
				entriesFromIndex: n
				do:
					[ : rec : bax : level | count := count + 1 ]
				until:
					[ : rec : bax : level | false ].
			self assert: count = (size-n+1) ]