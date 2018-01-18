*ma-core
maUnsigned24At: index
	"Return a 24-bit unsigned integer quantity starting from the given byte index"
	| b0 b1 w |
	w := self at: index.
	b1 := self at: index+1.
	b0 := self at: index+2.
	b1 = 0 ifFalse:[w := (b1 bitShift: 8) + w].
	b0 = 0 ifFalse:[w := (b0 bitShift: 16) + w].
	^w