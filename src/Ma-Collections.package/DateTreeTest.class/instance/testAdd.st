as yet unclassified
testAdd
	| dateRanges timespan |
	dateRanges := DateTree new.
	timespan := Timespan starting: now ending: twoWeeks.
	dateRanges at: timespan put: timespan.
	self assert: ((dateRanges at: timespan) = timespan)