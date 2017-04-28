accessing
mauiName

	| msg |
	msg := MaTextMessage new.
	msg append: (self maOriginalClass name first isVowel ifTrue: ['an '] ifFalse: ['a ']).
		self size = 0 ifTrue: [ msg append: 'empty ' ].
		msg append: self maOriginalClass name.
		self size = 0 ifFalse:
			[ | classCounts |
			msg append: ' of '.
			classCounts := (self collect: [ : each | each isBehavior ifTrue: [ Class ] ifFalse: [ each class ] ]) asBag sortedCounts.
			classCounts size > 1 ifTrue: [ msg append: 'mostly ' ].
			msg 
				appendProperlyPluralized: classCounts first value name
				for: classCounts first key ].
	^ msg messageText