accessing
progressMessage

	^String streamContents:
		[ : stream |
		stream maPrint: self unitsCompleted asBytesDescription.
		self knowsTaskSize
			ifTrue:
				[ stream
					maPrint: ' of ';
					maPrint: self taskSize asBytesDescription ].
		stream space.
		stream maPrint: self unitsVerbPhrase ] 