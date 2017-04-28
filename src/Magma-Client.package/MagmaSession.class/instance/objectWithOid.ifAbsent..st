accessing
objectWithOid: anInteger ifAbsent: aBlock 
	"Answer the object or its proxy, the one in the repository whose oid is anInteger.  If no object with that oid exists, answer the value of aBlock."
	^ guard critical: 
		[ serializer 
			objectWithOid: anInteger
			ifAbsent: 
				[ [ self realObjectFor: anInteger ] 
					on: MagmaInvalidOid
					do: 
						[ : exc | 
						"signaled in MaObjectFiler>>filePointerForOid:"
						aBlock value ] ] ]