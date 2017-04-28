*magma-client
maIsChangedFrom: aMaByteObjectBuffer using: aMaObjectSerializer
	"Because I got here, I am one of the shared special Array's in the system (see maAsStorageObject).  Changes are not tracked for logically referenced objects."

	^ self maUsesStandardStorage
		and:
			[ super
				maIsChangedFrom: aMaByteObjectBuffer
				using: aMaObjectSerializer ]