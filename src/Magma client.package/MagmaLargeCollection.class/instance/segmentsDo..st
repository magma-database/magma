enumerating (slow)
segmentsDo: oneArgBlock 
	"Unlike other slowlyDo: methods, this method does not lock me, so while you can get a large 'sampling', if the collection is changed while I'm enumerating, there's no guarantee you'll reach every element."
	| segment done index nextSignalTime |
	done := false.
	index := 1.
	nextSignalTime := Time millisecondClockValue + 5000.
	[ done ] whileFalse: 
		[ segment := self 
			segmentFromIndex: index
			pageSize: self enumerationPageSize.
		oneArgBlock value: segment.
		Time millisecondClockValue > nextSignalTime ifTrue: 
			[ MagmaNotification signal: (index - 1) printString , ' objects enumerated.'.
			nextSignalTime := Time millisecondClockValue + 5000 ].
		index := index + segment actualPageSize.
		done := segment atEnd ]