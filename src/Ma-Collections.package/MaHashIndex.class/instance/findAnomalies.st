SUnit tests
findAnomalies
	| answer |
	answer := Dictionary new.
	self allRecordsDo:
		[ :eachParentRec :eachChildRec |
		(eachChildRec 
			addAnomaliesTo: answer 
			usingParent: eachParentRec) ifTrue:
				[ MaNotification new
					tag: answer;
					signal ] ].
	^answer