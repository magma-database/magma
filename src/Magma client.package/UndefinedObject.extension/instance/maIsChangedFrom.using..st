*magma client
maIsChangedFrom: aMaByteObjectBuffer using: aMaObjectSerializer
	"Because nil keys develop in WeakKeyDictionaries, this method is necessary."
	^ false