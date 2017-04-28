private
removeOldestEntries
	"Remove the few oldest entries.."
	"First, remove the first entry and GC to hopefully gain a little space for an allocation."
	| victims |
	entries 
		remove: (entries 
				detect: [ : e | e isSystem not ]
				ifNone: [ nil ])
		ifAbsent: [ ^ false ].
	Smalltalk garbageCollect.
	victims := entries 
		copyFrom: 1
		to: (entries size // 3 max: 1).
	victims do: [ : each | each isSystem ifFalse: [ entries remove: each ] ].
	^ true