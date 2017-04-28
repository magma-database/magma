*ma base additions
maUint: bits at: position put: anInteger

	position + 1
		to: position + (bits // 8)
		do:
			[ :pos |
			self
				at: pos
				put: (anInteger digitAt: pos-position) ].
	^anInteger