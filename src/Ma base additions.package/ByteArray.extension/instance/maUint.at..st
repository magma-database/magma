*ma base additions
maUint: bits at: anInteger 
	"oids"
	| answer bytes |
	bits == 48 ifTrue: [ ^ self maUnsigned48At: anInteger + 1 ].
	"physicalSize, word buffers"
	bits == 32 ifTrue: 
		[ ^ self 
			unsignedLongAt: anInteger + 1
			bigEndian: false ].
	"control fields - bpMapIndex."
	bits == 8 ifTrue: [ ^ self byteAt: anInteger + 1 ].
	"class ids and classVersions"
	bits == 16 ifTrue: 
		[ ^ self 
			unsignedShortAt: anInteger + 1
			bigEndian: false ].
	bits == 24 ifTrue: [ ^ self maUnsigned24At: anInteger + 1 ].
	bits == 64 ifTrue: [ ^ self maUnsigned64At: anInteger + 1 ].
	bits == 40 ifTrue: [ ^ self maUnsigned40At: anInteger + 1 ].
	bits == 56 ifTrue: [ ^ self maUnsigned56At: anInteger + 1 ].
	bytes := bits // 8.
	answer := LargePositiveInteger new: bytes.
	1 
		to: bytes
		do: 
			[ : digitPosition | 
			answer 
				digitAt: digitPosition
				put: (self at: digitPosition + anInteger) ].
	^ answer normalize