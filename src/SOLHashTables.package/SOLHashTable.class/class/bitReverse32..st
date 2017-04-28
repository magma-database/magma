bit-manipulation
bitReverse32: anUnsignedInteger
	"Return the 32-bit reversed value of anUnsignedInteger.
	 Someone with more Squeak skill than I should improve this.
	 The C version of this uses a table of 256 bit reversed bytes, I'm using 4-bit nybbles here because I don't want to enter the whole table."
	| rvrs n frwd |
	frwd := anUnsignedInteger.
	rvrs := 0.
	0 to: 7 do:
	    [:i | n := frwd bitAnd: 16rF.
		frwd := frwd bitShift: -4.
		n := Elbbyn at: (1+n).
		rvrs := (rvrs bitShift: 4) bitOr: n].
	^rvrs