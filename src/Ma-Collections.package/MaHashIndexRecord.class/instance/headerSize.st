private
headerSize
	"Low and high keys.
	^(keySize / 8) * 2  simplified to / 4 for max performance."

	^keySize / 4
