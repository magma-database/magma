*ma base additions
maBeginsWith: aString caseSensitive: aBoolean 
	"Returns true if the receiver begins with the elements in aString, while ignoring the case if aBoolean is true."
	self size < aString size ifTrue: [ ^ false ].
	"Optimization.  Most strings will differ on the first character.."
	self first asLowercase = aString first asLowercase ifFalse: [ ^ false ].
	^ (self 
		findSubstring: aString
		in: self
		startingAt: 1
		matchTable: (aBoolean 
				ifTrue: [ CaseSensitiveOrder ]
				ifFalse: [ CaseInsensitiveOrder ])) = 1