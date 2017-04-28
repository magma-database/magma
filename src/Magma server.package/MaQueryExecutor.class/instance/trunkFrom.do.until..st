private
trunkFrom: startPosition do: twoArgBlock until:  conditionBlock
	"Enumerate my query-trunk from a particular starting point."
	| trunkSearchPosition |
	trunkSearchPosition := 1.
	trunkPosition := nil.
	self trunk trunkDo: 
		[ : eachTrunkClause | 
		| hdx rangeSize |
		hdx := collectionManager oidsIndexForAttribute: eachTrunkClause attribute.
		rangeSize := hdx 
			numberOfEntriesFrom: eachTrunkClause lowKey
			to: eachTrunkClause highKey.
		eachTrunkClause lastKnownSize: rangeSize.
		"is this NOT the trunk-clause which will contain trunk-position startPosition?"
		trunkSearchPosition + rangeSize - 1 < startPosition 
			ifTrue: [ trunkSearchPosition := trunkSearchPosition + rangeSize ]
			ifFalse: 
				[ "trunkSearchPosition is only set to position of the beginning of this clause of the trunk, trunkPosition keeps the actual trunkPosition."
				trunkPosition ifNil: [ trunkPosition := startPosition - 1 "start one-back since we pre-increment (because post-increment leaves it advanced one too far)" ].
				conditionBlock value ifFalse:
					[ hdx 
						keysAndValuesFrom: eachTrunkClause lowKey
						startingAt: (startPosition - trunkSearchPosition + 1 max: 1)
						do: 
							[ : eachKey : eachOid | 
							trunkPosition := trunkPosition + 1.
							twoArgBlock value: eachKey value: eachOid  ]
						until: 
							[ : eachKey : eachOid | 
							conditionBlock value 
							or: [ eachKey > eachTrunkClause highKey ] ].
					trunkSearchPosition := trunkPosition ] ]. 
].
	^ trunkPosition