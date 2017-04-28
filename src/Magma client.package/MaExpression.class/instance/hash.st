comparing
hash
	"At the expression level we have bigger numbers, so a lot of bits are set.  Therefore I chose to try bitXor: at this level instead of bitOr:."
	^ self terms 
		inject: operator hash
		into: [ : hash : each | hash bitXor: each hash ]