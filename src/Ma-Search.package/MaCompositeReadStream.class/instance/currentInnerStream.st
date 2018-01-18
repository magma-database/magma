private
currentInnerStream

	(currentInnerStream isNil or: [ currentInnerStream atEnd ])
		ifTrue:
			[ streams atEnd ifFalse: [ currentInnerStream := streams next ] ].
	^ currentInnerStream