*magma-client
maRefreshTo: aMaStorageObjectBuffer using: aMagmaSession

	| graphBuffer |
	graphBuffer := MaSerializedGraphBuffer byteArray: aMaStorageObjectBuffer asByteArray.
	graphBuffer buffersDo:
		[ : firstAndOnlyBuffer |  | s byteArray |
		byteArray := firstAndOnlyBuffer asByteArray.
		s := ReadStream on: byteArray.
		self class decodeIntFrom: s.
		self 
			decompress: self 
			fromByteArray: byteArray 
			at: s position+1 ]