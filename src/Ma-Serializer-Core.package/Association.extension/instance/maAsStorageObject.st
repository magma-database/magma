*ma-serializer-core
maAsStorageObject
	"I am about to be serialized into a ByteArray.  If I am a known global, write a proxy that will hook up with the same resource in the destination system.  This behavior emulates what Association>>#objectForDataStream: does."

	^ self maUsesStandardStorage 
		ifTrue: [ self ]
		ifFalse:
			[ DiskProxy
				global: #Smalltalk selector: #associationOrUndeclaredAt: 
				args: (Array with: key) ]