building
captureOldHashesFor: anObject 
	largeCollectionChanges do: 
		[ : eachChanges | 
		(eachChanges collection canIndex: anObject) ifTrue: 
			[ eachChanges collection indexesDo: 
				[ : eachIndex | 
				| oldKeys oldHashes |
				oldKeys := potentialKeysChange 
					at: anObject
					ifAbsentPut: [ MaIdentityDictionary new ].
				oldHashes := oldKeys 
					at: eachIndex attribute
					ifAbsentPut: [ OrderedCollection new ].
				oldHashes add: { 
						eachChanges.
						eachIndex.
						(eachIndex indexHashesFor: anObject)
					 } ] ] ]