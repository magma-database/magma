test Symbol canonicalization
addNewSymbolViaPath1
	self deny: (clientSession definition symbols includes: #newSymbol19283746).
	clientSession commit:
		[ (clientSession root at: #testSymbolCanonicalization) first
			instVarNamed: 'unused'
			put: #newSymbol19283746 ].
	self assert: (clientSession definition symbols includes: #newSymbol19283746)