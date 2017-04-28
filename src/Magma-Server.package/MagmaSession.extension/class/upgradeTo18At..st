*magma-server
upgradeTo18At: aMagmaLocalLocation 
	| location traverser compressor session oidsBySymbol oidConversions |
self maMarked: 'delete'.  "Decided not to automatically canoncicalize all Symbols into the RepositoryDefinition because, especially after having run a #codeBackup, it bloats the Symbols up to over 42K.  Otherwise there were just 109.
	So then I thought about making it a settable option, but if the user is going to set the option they can just pre-commit their Symbols themself!"
location := aMagmaLocalLocation asMagmaLocalLocation.
	self verifyRepositoryAt: location isVersion: 17.
	traverser := MagmaFileTraverser for: location.
	oidsBySymbol := Dictionary new.
	traverser anchorGraphDo:
		[ : eachBuffer | eachBuffer classId = 11 ifTrue:
			[ (oidsBySymbol
				at: eachBuffer asString
				ifAbsentPut: [ OrderedCollection new ]) add: eachBuffer oid ] ].
	"Interesting to see all the Symbols in the db and how many occurrences of each we had."
oidsBySymbol do: [ : each | each sort ].
oidsBySymbol explore.
	oidConversions := Dictionary new.
	oidsBySymbol keysAndValuesDo:
		[ : eachSymbol : eachOids | eachOids size > 1 ifTrue:
			[ eachOids withIndexDo:
				[ : oid : index | index > 1 ifTrue:
					[ oidConversions
						at: oid
						put: eachOids first ] ] ] ].
self halt.
	"commitRestore if necessary."
	location isLocal ifTrue:
		[ (MagmaRepositoryController open: location) in:
			[ : cont | cont restoreMode ifTrue: [ cont commitRestore ].
			cont close ] ].
	"Now do a second pass where we replace all references to the Symbols to the canonicalized one."
	compressor := (MagmaCompressor source: location) upgradeBlock:
		[ : eachBuffer | eachBuffer isPointers ifTrue:
			[ eachBuffer instVarsDoWithIndex:
				[ : eachReferencedOid : index | oidConversions
					at: eachReferencedOid
					ifPresent:
						[ : canonicalizedOid | eachBuffer
							maInstVarAt: index
							put: canonicalizedOid ]
					ifAbsent: [  ] ] ] ].
	compressor compressTo: location pathName, '-ver.18'.
	session := location newSession
		 allowWriteBarrier: false ;
		 connectAs: 'upgrade to 18' ;
		 yourself.
	[ "Finally, populate the found Symbols into the RepositoryDefinition."
	session definition symbols: oidsBySymbol keys asSet.
	session repositoryController repository filer version: 18 ] ensure: [ session disconnectAndClose ]