as yet unclassified
testIteration
	| dateRanges |
	
	dateRanges := DateTree new.
	timespans do: [ :ea | dateRanges at: ea put: ea asString ].
	dateRanges keysAndValuesDo: [ :key :val | self assert: (key asString) = val ].