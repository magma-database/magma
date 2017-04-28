test sequence-number generator
startGeneratingSequenceNumbers
	shouldStopGeneratingSequenceNumbers := false.
	sequenceNumbers := OrderedCollection new.
	[ [ shouldStopGeneratingSequenceNumbers ] whileFalse: [ sequenceNumbers add: self getNextSequenceNumber ].
	shouldStopGeneratingSequenceNumbers := 'done' ] fork name: 'generating sequence numbers'