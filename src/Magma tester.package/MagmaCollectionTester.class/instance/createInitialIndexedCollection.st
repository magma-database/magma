test querys - persistent result sets
createInitialIndexedCollection
	| mc array |
	mc := (MagmaCollection new)
		addIndex: (MaIntegerIndex attribute: #first) ;
		yourself.
	"Array of 1-element Array's."
	array := (1 to: 100) collect: [ : n | Array with: n ].
	mc addAll: array.
	"add some duplicates"
	(array 
		copyFrom: 51
		to: 60) do: [ : each | mc add: each ].
	clientSession commit: 
		[ clientSession root 
			at: 'testPersistentResultSet-originalCollection'
			put: mc ]