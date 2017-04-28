*solhashtables
murmurHashNeutral32
	| seed len len4 h k i m r |
	seed := 2863311530.
	m := 1540483477.
	r := -24.
	len := self size.
	len4 := len bitAnd: 65532.
	h := seed bitXor: len.
	i := 0.
	[ i < len4 ] whileTrue:
		[ k := self byteAt: i + 1.
		k := (k bitShift: 8) bitOr: (self byteAt: i + 2).
		k := (k bitShift: 8) bitOr: (self byteAt: i + 3).
		k := (k bitShift: 8) bitOr: (self byteAt: i + 4).
		k := k * m bitAnd: 4294967295.
		k := k bitXor: (k bitShift: r).
		k := k * m bitAnd: 4294967295.
		h := (h * m bitAnd: 4294967295) bitXor: k.
		i := i + 4 ].
	"Now deal with up to 3 bytes in the tail end."
	len := len bitAnd: 3.
	len >= 3 ifTrue: [ h := h bitXor: ((self byteAt: i + 3) bitShift: 16) ].
	len >= 2 ifTrue: [ h := h bitXor: ((self byteAt: i + 2) bitShift: 8) ].
	len >= 1 ifTrue:
		[ h := h bitXor: (self byteAt: i + 1).
		h := h * m bitAnd: 4294967295 ].
	h := h bitXor: (h bitShift: -13).
	h := h * m bitAnd: 4294967295.
	h := h bitXor: (h bitShift: -15).
	^ h
