*magma server-private
addMinimumEnumerationsTo: aMaQueryTrunk using: aMagmaLargeCollectionManager 
	aMaQueryTrunk addClause: (self asTrunkClause lastKnownSize: (self isAlwaysFalse 
				ifTrue: [ 0 ]
				ifFalse: 
					[ (aMagmaLargeCollectionManager oidsIndexForAttribute: attribute) 
						numberOfEntriesFrom: lowKey
						to: highKey ]))