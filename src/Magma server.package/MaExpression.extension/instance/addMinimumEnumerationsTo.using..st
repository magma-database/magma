*magma server-private
addMinimumEnumerationsTo: aMaQueryTrunk using: aMagmaLargeCollectionManager 
	"For each OR'd condition, we must add a new range to aMaQueryTrunk.  Within each OR, we select the shortest ANDed condition to add to aMaQueryTrunk."
	self isConjunction 
		ifTrue: 
			[ | smallest smallestSize |
			smallest := smallestSize := nil.
			self terms do: 
				[ : each | 
				| eachSize |
				eachSize := each minimumSearchSpaceSizeUsing: aMagmaLargeCollectionManager.
				(smallest isNil or: [ eachSize < smallestSize ]) ifTrue: 
					[ smallest := each.
					smallestSize := eachSize ] ].
			smallest 
				addMinimumEnumerationsTo: aMaQueryTrunk
				using: aMagmaLargeCollectionManager ]
		ifFalse: 
			[ self terms do: 
				[ : each | 
				each 
					addMinimumEnumerationsTo: aMaQueryTrunk
					using: aMagmaLargeCollectionManager ] ]