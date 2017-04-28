as yet unclassified
testFirstLast
	| dateRanges |
	dateRanges := DateTree new.
	self should: [ dateRanges first ] raise: Error.
	self should: [ dateRanges last ] raise: Error.
	dateRanges at: (Timespan starting: tomorrow ending: nextWeek) put: #inner.
	self assert: dateRanges first = #inner.
	self assert: dateRanges last = #inner.
	dateRanges at: (Timespan starting: now ending: twoWeeks) put: #outer.
	self assert: dateRanges first = #outer.
	self assert: dateRanges last = #outer.
	dateRanges at: (Timespan starting: tomorrow ending: threeWeeks) put: #last.
	self assert: dateRanges first = #outer.
	self assert: dateRanges last = #last