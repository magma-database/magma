testing
isOidForOptimizedObject: oidInteger 
	"Answer whether oidInteger is an oid for anObject which will never require its own buffer.  These include optimized Integers, nil, true, false, and all Characters."
	^ oidInteger <= LastCharacterOid or: [ oidInteger >= FirstFloatOid ]