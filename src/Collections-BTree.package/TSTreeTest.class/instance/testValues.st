as yet unclassified
testValues
	self assert: tree values asSet = (self words asSet collect: [:ea | ea asUppercase]).
	self assert: empty values isEmpty