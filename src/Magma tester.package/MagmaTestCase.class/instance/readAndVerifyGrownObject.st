test grow an object
readAndVerifyGrownObject
	| arr |
	arr := clientSession abort root at: 'testGrowObject'.
	self should: [ arr first = (101 to: 259) asSet ].
	self should: [ (arr at: 2) = '2' ].
	self should: [ arr last maEquivalentForSerializationTest: self peopleSample1 ]