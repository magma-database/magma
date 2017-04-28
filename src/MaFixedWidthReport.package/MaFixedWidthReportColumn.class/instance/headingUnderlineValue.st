private
headingUnderlineValue
	| headingChar underlineString |
	headingChar := self headingUnderlineCharacter isNil 
		ifTrue: [ Character space ]
		ifFalse: [ self headingUnderlineCharacter ].
	underlineString := (String new: (self headingText size min: self width)) atAllPut: headingChar.
	^ self formattedValue: underlineString