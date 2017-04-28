private
conditionedKeyword: aString 
	"Answer the keyword aString conditioned for keyword search (i.e., padded to meaningfulCharacters, characters not in my lowChar..highChar range stripped)."
	| stringIndex conditionedStringIndex conditionedString |
	conditionedString := (String new: meaningfulCharacters) atAllPut: (Character value: self lowChar).
	stringIndex := 1.
	conditionedStringIndex := 1.
	"First, load conditionedString with conditioned characters from aString."
	[ conditionedStringIndex <= meaningfulCharacters and: [ stringIndex <= aString size ] ] whileTrue: 
		[ | conditionedChar |
		conditionedChar := (aString at: stringIndex) asUppercase.
		(conditionedChar asciiValue 
			between: self lowChar
			and: self highChar) ifTrue: 
			[ conditionedString 
				at: conditionedStringIndex
				put: conditionedChar.
			conditionedStringIndex := conditionedStringIndex + 1 ].
		stringIndex := stringIndex + 1 ].
	^ conditionedString