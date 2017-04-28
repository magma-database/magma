private
processRemovedIndexesIn: aMaCollectionChanges 
	aMaCollectionChanges removedIndexesDo: 
		[ : eachAttribute | 
		{ 
			(self oidsIndexForAttribute: eachAttribute).
			(self keysIndexForAttribute: eachAttribute)
		 } do: [ : eachHashIndex | self removeIndex: eachHashIndex ].
		keyIndexesByAttribute 
			removeKey: eachAttribute
			ifAbsent: 
				[ "hmmm"
				 ].
		oidIndexesByAttribute 
			removeKey: eachAttribute
			ifAbsent: 
				[ "don't think this should happen, but would hate to blow up when someone is just trying to remove an index."
				 ] ]