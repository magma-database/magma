private
mergeRemoved
	collection changes removedDo: 
		[ : eachObject : eachHashes | 
		(expression qualifyingHashesOf: eachObject) do: 
			[ : each | 
			each value < segment lowestKey 
				ifTrue: [ segment advanceStart: -1 ]
				ifFalse: 
					[ "The server already excluded removed from the result, and is accounted for everywhere except the lastKnownSize.  No need to retreat the endIndex.."
					"segment advanceEnd: -1"
					segment advanceLastKnownSize: -1 ] ] ]