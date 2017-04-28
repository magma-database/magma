private
selectorPartsAndArgsDo: twoArgBlock 
	selector isUnary
		ifTrue:
			[ twoArgBlock
				value: selector
				value: nil ]
		ifFalse:
			[ selector isKeyword
				ifTrue:
					[ (selector subStrings: ':') withIndexDo:
						[ : eachPart : x | twoArgBlock
							value: eachPart , ':'
							value: 'arg' , x asString ] ]
				ifFalse:
					[ twoArgBlock
						value: selector
						value: 'arg1' ] ]