as yet unclassified
testInclusiveRange
	| dateRanges returnedDates expectedDates |
	
	dateRanges := DateTree new.
	timespans do: [ :ea | dateRanges at: ea put: ea asString ].
	expectedDates := timespans collect: [ :ea | ea asString ].
	returnedDates := (dateRanges between: now and: threeWeeks) collect: [ :ea | ea asString ].
	self assert: (returnedDates intersection: expectedDates) size = expectedDates size.