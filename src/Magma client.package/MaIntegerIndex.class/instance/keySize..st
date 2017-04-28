overriding
keySize: numberOfBits
	"Only set this ONCE, when you create.  It is not changeable after the index is created."
	(MaHashIndex validKeySizes includes: numberOfBits)
		ifFalse: [ MagmaUserError signal: 'keySize must be one of ' , MaHashIndex validKeySizes printString ].
	keySize := numberOfBits