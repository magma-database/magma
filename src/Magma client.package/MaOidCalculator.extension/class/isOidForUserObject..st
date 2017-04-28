*magma client
isOidForUserObject: anInteger
	"A 'user' object is a persistent object stored in a Magma database that does not have a special oid, such as SmallIntegers, Floats, Booleans, etc. have."

	^anInteger
		between: self firstUserObjectOid
		and: self lastUserObjectOid