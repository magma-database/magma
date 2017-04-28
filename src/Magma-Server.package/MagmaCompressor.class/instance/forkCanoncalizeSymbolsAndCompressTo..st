compress
forkCanoncalizeSymbolsAndCompressTo: outputLocation 
	process := MaClientProcess doBlock:
		[ | traverser oidsBySymbol oidConversions |
		process
			 name: 'canoncalizeSymbolsAndCompressTo: ' , outputLocation ;
			 unitsVerbPhrase: ' objects traversed' ;
			 description: 'Collecting oid-collections by Symbol...' ;
			 priority: Processor userSchedulingPriority.
		self guessTaskSize.
		traverser := MagmaFileTraverser for: sourceLocation.
		oidsBySymbol := Dictionary new.
		traverser anchorGraphDo:
			[ : eachBuffer | process advance.
			(eachBuffer classId = 11 and: [ (MaOidCalculator isOidForNewObject: eachBuffer oid) not ]) ifTrue:
				[ (oidsBySymbol
					at: eachBuffer asString
					ifAbsentPut: [ OrderedCollection new ]) add: eachBuffer oid ] ].
		process
			 description: traverser objectCount asString , ' objects in the database.' ;
			 unitsCompleted: 0 ;
			 taskSize: traverser objectCount.
		"Interesting to see all the Symbols in the db and how many occurrences of each we had."
		oidsBySymbol := oidsBySymbol reject:
			[ : eachColl | eachColl size = 1 or:
				[ eachColl anySatisfy:
					[ : eachOid | MaOidCalculator isOidForNewObject: eachOid ] ] ].
		oidsBySymbol do:
			[ : each | each sort ].
		oidsBySymbol explore.
		oidConversions := Dictionary new.
		oidsBySymbol keysAndValuesDo:
			[ : eachSymbol : eachOids | eachOids size > 1 ifTrue:
				[ eachOids withIndexDo:
					[ : oid : index | index > 1 ifTrue:
						[ oidConversions
							at: oid
							put: eachOids first ] ] ] ].
"I'm not sure why we need this.  Try removing it?"
		sourceLocation detachFromNode.
		"Now do a second pass where we replace all references to the Symbols to the canonicalized one."
		self upgradeBlock:
			[ : eachBuffer | eachBuffer isPointers
				ifTrue:
					[ eachBuffer instVarsDoWithIndex:
						[ : eachReferencedOid : index | oidConversions
							at: eachReferencedOid
							ifPresent:
								[ : canonicalizedOid | eachBuffer
									maInstVarAt: index
									put: canonicalizedOid ]
							ifAbsent: [  ] ] ]
				ifFalse: [ eachBuffer ] ].
		self compressTo: outputLocation ].
	process
		 resume ;
		 yourself