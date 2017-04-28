*ma-serializer-core
maNextBufferDo: aBlock 
	| remainingBytes header record recordSize |
	remainingBytes := self size - self position.
	remainingBytes < 4 ifTrue: [ ^ false ].
	header := self next: 4.
	self position: self position - 4.
	recordSize := header 
"		maUint: MaSerializedGraphBuffer headerSize * 8 32"
		maUnsigned32At: 1.
	recordSize = 0 ifTrue: 
		[ "Normally, this shouldn't happen, but when loading from a ZipArchive member, someone changed it to come in from a MultiByteBinaryOrTextStream, which is not 100% compatible with StandardFileStream.  In some cases we end up with zero-bytes on the end of the file.."
		^ false ].
	remainingBytes >= recordSize ifFalse: [ ^ false ].
	record := self next: recordSize.
	aBlock value: record.
	^ true