as yet unclassified
testRemove
	| dateRanges timespan |
	dateRanges := DateTree new.
	timespans do: [ :ea | dateRanges at: ea put: ea asString. ].
	timespan := timespans anyOne.
	self assert: (dateRanges at: timespan) = timespan asString.
	dateRanges removeKey: timespan.
	self assert: ((dateRanges at: timespan ifAbsent: [ false ]) = false)