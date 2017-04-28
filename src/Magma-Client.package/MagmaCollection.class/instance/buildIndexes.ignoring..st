private
buildIndexes: aCollection ignoring: objectOidsAlreadyIndexed 
	"aCollection of MaIndexDefinitions."
	MagmaNotification signal: 'About to build ' , aCollection size printString , ' indexes.'.
	session begin.
	self segmentsDo: 
		[ : each | 
		[ each objects do: 
			[ : eachObject | 
			| oid |
			oid := session oidFor: eachObject.
			(MaOidCalculator isOidForNewObject: oid) ifTrue: [ MagmaSoftwareError signal: 'expected a persistent object' ].
			(objectOidsAlreadyIndexed includes: oid) ifFalse: 
				[ aCollection do: 
					[ : eachIndex | 
					changes 
						add: oid
						at: (eachIndex indexHashesFor: eachObject)
						toIndexForAttribute: eachIndex attribute ] ] ].
		session commitAndBegin ] 
			on: MagmaCommitConflictError
			do: 
				[ : err | 
				changes resetNewIndexValues.
				err retry ] ].
	[ session commit ] 
		on: MagmaCommitConflictError
		do: [ : err | err retry ].
	self commitUnlock.
	MagmaNotification signal: 'Indexes built.'