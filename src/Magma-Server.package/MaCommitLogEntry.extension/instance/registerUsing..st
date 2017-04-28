*magma-server
registerUsing: aMaObjectRepository
	"Register all new objects by assigning them their permanentOids."

	| map |
	map := Dictionary new: 100.
	commitPackage newObjectsDo:
		[ : eachBuffer |
		eachBuffer oid: 
			(map
				at: eachBuffer oid
				put: aMaObjectRepository getNextOid).
		result recordNewObjectBuffer: eachBuffer copyWithSameBuffer ].
	result permanentOids: map