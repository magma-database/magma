access
from: fromKey to: toKey do: oneArgBlock 
	| endHash |
	endHash := index indexHashForIndexObject: toKey.
	table
		from: (index indexHashForIndexObject: fromKey)
		do: oneArgBlock
		until:
			[ : eachSOLHashNode | eachSOLHashNode key > endHash ]