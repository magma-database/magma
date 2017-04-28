bit-manipulation
bitReverse29: anUnsignedInteger
	"Return the low order 29-bit reversed value of anUnsignedInteger.
	 Someone with more Squeak skill than I should improve this.
	 The C version of this uses a table of 256 bit reversed bytes, I'm using 4-bit nybbles here because I don't want to enter the whole table."
	| rvrs n frwd |
	frwd := anUnsignedInteger.
	rvrs := 0.
	0 to: 6 do:
	    [:i | n := frwd bitAnd: 16rF.
		frwd := frwd bitShift: -4.
		n := Elbbyn at: (1+n).
		rvrs := (rvrs bitShift: 4) bitOr: n].
	"28 bits done, now the 29th."
	rvrs := (rvrs bitShift: 1) bitOr: (frwd bitAnd: 1).
	^rvrs as31BitSmallInt