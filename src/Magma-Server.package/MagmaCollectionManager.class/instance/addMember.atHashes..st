private
addMember: addedObjectOid atHashes: eachHashIndexArrays 
	memberIndex 
		add: self dummyValue
		at: addedObjectOid.
	eachHashIndexArrays withIndexDo: 
		[ : eachHashValues : x | 
		eachHashValues do: 
			[ : eachHashValue | 
			(oidIndexes at: x) 
				add: addedObjectOid
				at: eachHashValue.
			(keyIndexes at: x) 
				add: eachHashValue
				at: addedObjectOid ] ]