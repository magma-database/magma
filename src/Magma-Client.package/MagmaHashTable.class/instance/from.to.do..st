access
from: fromKey to: toKey do: oneArgBlock 
	| endHash |
	endHash := index indexHashForIndexObject: toKey.
	table
		from: (index indexHashForIndexObject: fromKey)
		do: [ : eachSOLHashNode | oneArgBlock value: eachSOLHashNode value ]
		until: [ : eachSOLHashNode | eachSOLHashNode key > endHash ]