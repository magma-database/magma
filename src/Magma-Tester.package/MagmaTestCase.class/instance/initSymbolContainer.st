test Symbol canonicalization
initSymbolContainer
	self deny: (clientSession definition symbols includes: #newSymbol19283746).
	clientSession commit:
		[ clientSession root
			at: #testSymbolCanonicalization
			put: {MagmaContact new.  MagmaContact new} ]