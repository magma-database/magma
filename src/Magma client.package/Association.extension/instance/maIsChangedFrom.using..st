*magma client
maIsChangedFrom: aMaByteObjectBuffer using: aMaObjectSerializer
	"If I was an Association for a known global (see #maAsStorageObject), then I am being stored as a Proxy.  Changes to these global relationships are not tracked."

	^ false