*ma base additions
maActualMethod

	| class |
	^(class := self actualClass)
		ifNil: [ nil ]
		ifNotNil:
			[ (class canUnderstand: self selector)
				ifTrue: [ class >> self selector ]
				ifFalse: [ nil ] ]