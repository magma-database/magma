*ma object serialization-squeak
maAsStorageObject
	"Emulating the behavior of #objectForDataStream:."
	^ self isGlobalFlap
		ifTrue:
			[ DiskProxy
				global: #Flaps selector: #globalFlapTabOrDummy: 
				args: {self flapID} ]
		ifFalse: [ self ]