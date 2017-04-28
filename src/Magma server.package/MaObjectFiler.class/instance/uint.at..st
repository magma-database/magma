private
uint: bits at: anInteger

	| address bytes |

	address := self usedByteArray: (bytes := bits / 8).
	file
		maRead: bytes
		bytesFromPosition: 1
		of: address
		atFilePosition: anInteger.
	^address
		maUint: bits
		at: 0
