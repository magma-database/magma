must override
indexHashForIndexObject: anUUID
	"anUUID is a 16 byte ByteArray"

	^ anUUID maUint: self keySize at: 0