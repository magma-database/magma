*writebarrier
partsAndArgsDo: twoArgBlock 
	self isUnary
		ifTrue:
			[ twoArgBlock
				value: self
				value: nil ]
		ifFalse:
			[ self isKeyword
				ifTrue:
					[ (self subStrings: ':') withIndexDo:
						[ : eachPart : x | twoArgBlock
							value: eachPart , ':'
							value: 'arg' , x asString ] ]
				ifFalse:
					[ twoArgBlock
						value: self
						value: 'arg1' ] ]