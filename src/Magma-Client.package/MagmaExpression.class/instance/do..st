enumerating
do: aBlock
	"depth-first traversal"
self maMarked: 'delete'.
	self terms do: [ :t | t do: aBlock ].
	aBlock value: self


