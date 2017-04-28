test Symbol canonicalization
testSymbolCanonicalization
	self
		remotePerform: #initSymbolContainer in: 'client1' ;
		remotePerform: #makeSureSymbolContainerMaterialized in: 'client2' ;
		remotePerform: #addNewSymbolViaPath1 in: 'client1' ;
		remotePerform: #addNewSymbolViaPath2AndVerify in: 'client2'.
	self assert:
		(self
			remotePerform: #oidOfNewSymbol in: 'client1')
			= (self remotePerform: #oidOfNewSymbol in: 'client2')