change sets
addChangeSet: aChangeSet 
	"Add methods contained in aChangeSet."
	| changesDictionary |
	changesDictionary := aChangeSet methodChanges.
	changesDictionary keysAndValuesDo:
		[ : eachClassName : eachChangesDict | | class |
		class := eachClassName substrings size = 1
			ifTrue: [ Smalltalk classNamed: eachClassName ]
			ifFalse: [ Smalltalk classNamed: eachClassName substrings first asSymbol ].
		class ifNotNil:
			[ eachClassName substrings size > 1 ifTrue: [ "if it is a class method"
				class := class class].
			eachChangesDict keysAndValuesDo:
				[ : eachSelector : eachChangeType | (#(#add #change ) includes: eachChangeType) ifTrue:
					[ (class methodDict includesKey: eachSelector) ifTrue: [ self addMethod: (class compiledMethodAt: eachSelector) ] ] ] ] ]