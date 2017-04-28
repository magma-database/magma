accessing
messageText

	stream last = $. ifFalse: [ stream nextPut: $. ].
	^stream contents
