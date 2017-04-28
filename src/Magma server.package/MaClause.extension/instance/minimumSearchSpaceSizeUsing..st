*magma server-private
minimumSearchSpaceSizeUsing: aMagmaCollectionManager 
	^ self isAlwaysFalse 
		ifTrue: [ 0 ]
		ifFalse: 
			[ (aMagmaCollectionManager oidsIndexForAttribute: attribute) 
				numberOfEntriesFrom: lowKey
				to: highKey ]