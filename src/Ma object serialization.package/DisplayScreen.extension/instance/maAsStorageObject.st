*ma object serialization
maAsStorageObject
	"Emulate the same behavior as #objectForDataStream:."

	^ DiskProxy global: #Display selector: #yourself args: #()