*ma-serializer-core
maDirtyAdd: anAssociation
	"When materializing a HashedCollection, we cannot depend on hash calculations being valid until all other objects have been materialized."
	array
		at: (tally := tally + 1)
		put: anAssociation