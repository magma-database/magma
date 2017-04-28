*magma-client
maIsChangedFrom: aMaStorageObjectBuffer using: aMaObjectSerializer

	| graphBuffer |
	graphBuffer := MaSerializedGraphBuffer byteArray: aMaStorageObjectBuffer asByteArray.
	graphBuffer buffersDo:
		[ : firstAndOnlyBuffer |
		^ self compressToByteArray ~= firstAndOnlyBuffer asByteArray ]