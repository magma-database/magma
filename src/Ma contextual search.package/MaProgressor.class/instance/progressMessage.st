accessing
progressMessage

	^String streamContents:
		[ : stream |
		stream maPrint: self unitsCompleted.
		self knowsTaskSize
			ifTrue:
				[ stream
					maPrint: ' of ';
					maPrint: self taskSize ].
		stream space.
		stream maPrint: self unitsVerbPhrase ] 