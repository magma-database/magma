private
ensureHistoricalEntry: aMCDefinition 
	| entries |
	entries := objects
		at: aMCDefinition description
		ifAbsentPut: [ OrderedCollection new ].
	^ (entries includes: aMCDefinition) ifFalse: [ entries add: aMCDefinition ]