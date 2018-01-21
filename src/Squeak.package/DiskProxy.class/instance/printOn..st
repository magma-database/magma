printing
printOn: aStream
	"Try to report the name of the project"

	globalObjectName == #Project ifFalse: [^ super printOn: aStream].
	constructorArgs size > 0 ifFalse: [^ super printOn: aStream].
	constructorArgs first isString ifFalse: [^ super printOn: aStream].
	aStream nextPutAll: constructorArgs first, ' (on server)'