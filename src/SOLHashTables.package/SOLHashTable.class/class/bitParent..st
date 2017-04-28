bit-manipulation
bitParent: anUnsignedInteger
	"Return anUnsignedInteger with the most significant 1-bit changed to 0."
	(0 = anUnsignedInteger) ifTrue: [^0].
	^ anUnsignedInteger bitXor: (1 bitShift: ((anUnsignedInteger highBit) - 1))