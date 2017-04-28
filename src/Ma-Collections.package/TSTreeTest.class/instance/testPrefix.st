as yet unclassified
testPrefix
	self assert: (tree matchesForPrefix: 'abet') asSet = #(ABET ABETMENT) asSet.
	self assert: (tree matchesForPrefix: 'abelm') asSet = #(ABELMOSCHUS ABELMOSK) asSet.
	self assert: (tree matchesForPrefix: '') asSet = (self words asSet collect: [:ea | ea asUppercase]).
	self assert: (empty matchesForPrefix: 'foo') = #()