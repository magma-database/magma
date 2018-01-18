*ma-core
maUnsigned40At: index
	"Return a 40-bit unsigned integer quantity starting from the given byte index"
	| v |
	(v := self at: index + 4) = 0 ifFalse: [
		^(LargePositiveInteger new: 5)
			replaceFrom: 1
				to: 5
				with: self
				startingAt: index;
			normalize ].
	(v := self at: index + 3) <= 16r3F ifFalse: [
		^(LargePositiveInteger new: 4)
			replaceFrom: 1
				to: 4
				with: self
				startingAt: index;
			normalize ].
	^(((v bitShift: 8) + (self at: index + 2) bitShift: 8) + (self at: index + 1) bitShift: 8) + (self at: index)