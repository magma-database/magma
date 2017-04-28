as yet unclassified
fieldsWrittenToBySelector: selectorSymbol 
	| allInstVarNames transientFieldNumbers |
	allInstVarNames := self targetClass allInstVarNames.
	transientFieldNumbers := self targetClass basicNew maTransientVariables collect:
		[ : eachVarName | allInstVarNames indexOf: eachVarName ].
	^ (super fieldsWrittenToBySelector: selectorSymbol) reject:
		[ : eachFieldNumber | transientFieldNumbers includes: eachFieldNumber ]