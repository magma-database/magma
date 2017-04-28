building
appendAndedList: aCollection

	self
		appendList: (
			aCollection
				collect: [ :each | each isString ifTrue: [ each ] ifFalse: [ each printString ] ])
		with: ' and '
