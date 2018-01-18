*ma-core
messagePartsDo: oneArgBlock 
	self first isLetter
		ifTrue:
			[ | stream |
			stream := ReadStream on: self.
			[ stream atEnd ] whileFalse: [ oneArgBlock value: (stream maUpToIncluding: $:) ] ]
		ifFalse: [ oneArgBlock value: self ]