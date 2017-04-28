accessing
collectionOid
	"for Magma, the fileId is stored in two parts, the high-order 6 bytes represent the oid of the collection.  The low-order 2 bytes represent the index # for that collection or 0 if it is the memberIndex.  This method answers the oid."

	^ self fileId bitShift: -16