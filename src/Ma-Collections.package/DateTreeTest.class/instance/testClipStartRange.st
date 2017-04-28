as yet unclassified
testClipStartRange
	| dateRanges returnedDates expectedDates |
	
	dateRanges := DateTree new.
	timespans do: [ :ea | dateRanges at: ea put: ea asString ].
	expectedDates := timespans select: [ :ea | (ea start >= nextWeek) and: [ ea end <= twoWeeks ]] thenCollect: [ :ea | ea asString ].
	returnedDates := (dateRanges between: nextWeek and: twoWeeks) collect: [ :ea | ea asString ].
	self assert: (returnedDates intersection: expectedDates) size = expectedDates size.