test Symbol canonicalization
addNewSymbolViaPath2AndVerify
	| persons |
	self
		 deny: (clientSession definition symbols includes: #newSymbol19283746) ;
		 assert: (MaOidCalculator isOidForNewObject: (clientSession oidFor: #newSymbol19283746)).
	persons := localRoot at: #testSymbolCanonicalization.
"	self assert: (persons first instVarNamed: 'unused') maIsMutatingProxy."
	persons last
		instVarNamed: 'unused'
		put: #newSymbol19283746.
	clientSession commit.
	self assert: (clientSession definition symbols includes: #newSymbol19283746).
	localRoot := Dictionary new