*ma-core
maEndsWith: aString caseSensitive: aBoolean 
	"Returns true if the receiver begins with the elements in aString,while ignoring the case if aBoolean is true."
	| extra |
	(extra := self size - aString size) < 0 ifTrue: [ ^ false ].
	^ (self 
		findSubstring: aString
		in: self
		startingAt: extra + 1
		matchTable: (aBoolean 
				ifTrue: [ CaseSensitiveOrder ]
				ifFalse: [ CaseInsensitiveOrder ])) > 0