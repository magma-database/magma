test sequence-number generator
startGeneratingSequenceNumbers
	shouldStopGeneratingSequenceNumbers := false.
	sequenceNumbers := OrderedCollection new.
	[ [ shouldStopGeneratingSequenceNumbers ] whileFalse:
		[ sequenceNumbers add: self getNextSequenceNumber.
		sequenceNumbers size \\ 100 = 0 ifTrue: [ clientSession refresh ] ].
	shouldStopGeneratingSequenceNumbers := 'done' ] fork name: 'generating sequence numbers'