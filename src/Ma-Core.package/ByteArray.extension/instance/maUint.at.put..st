*ma-core
maUint: bits at: position put: anInteger
	bits == 32 ifTrue: [ ^ self longAt: position+1 put: anInteger bigEndian: false ].
	bits == 64 ifTrue: [ ^ self unsignedLong64At: position+1 put: anInteger bigEndian: false ].
	position + 1
		to: position + (bits // 8)
		do:
			[ :pos |
			self
				at: pos
				put: (anInteger digitAt: pos-position) ].
	^anInteger