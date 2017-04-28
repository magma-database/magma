private
bestArraySizeFor: size
	| hb |
	hb := size highBit. 
	^ (hb <= Primes size) ifTrue: [ Primes at: hb ] ifFalse: [ size ]