enumerating
do: aBlock
	"depth-first traversal"

	self terms do: [ :t | t do: aBlock ].
	aBlock value: self


