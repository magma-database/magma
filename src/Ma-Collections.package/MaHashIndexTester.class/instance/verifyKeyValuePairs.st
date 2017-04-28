private tests
verifyKeyValuePairs
	| keysAndValues |
	keysAndValues := self index
		upTo: predictedSize * 2
		keysAndValuesFromIndex: 1.
	self assert: keysAndValues first size = self allValues size.
	keysAndValues first
		with: keysAndValues second
		do:
			[ : key : value | self assert: ((values at: key) includes: value) ]