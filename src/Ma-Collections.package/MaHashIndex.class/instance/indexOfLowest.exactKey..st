private
indexOfLowest: keyInteger exactKey: aBoolean 
	"If aBoolean is true, answer 0 if we don't find an exact key.  If false answer the index of the first equal or higher key."
	| total index |
	^ guard critical: 
		[ total := 0.
		self 
			navigateToward: keyInteger
			until: 
				[ : currentRecord | 
				| foundRecord |
				foundRecord := false.
				currentRecord 
					eligibleByteArrayIndexesFor: keyInteger
					do: 
						[ : each | 
						((currentRecord hasEntryAtByteArrayIndex: each) and: [ (currentRecord keyAtByteArrayIndex: each) >= keyInteger ]) ifTrue: [ foundRecord := true ] ].
				total := total + (record numberOfChildrenBefore: keyInteger).
				foundRecord ]
			do: 
				[ : currentRecord | "nada" ].
		"We now have the correct potential record selected and a correct total number of entries that occur before the entry that would contain keyInteger.  Now determine whether we should answer it or nil"
		index := total + 1.
		aBoolean 
			ifTrue: 
				[ (record hasEntryForKey: keyInteger) 
					ifTrue: [ ^ index ]
					ifFalse: [ 0 ] ]
			ifFalse: 
				[ index > self size 
					ifTrue: [ 0 ]
					ifFalse: [ index ] ] ]