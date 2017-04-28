*magma-client
hashKey32
	"Used for MaFloatIndex.
	Implementation:  32-bit Floats asIEEE32Bit Integers map as follows:
		-Infinity =  4286578688
		-negative floats = 4286578687 --  2147483649
		-0.0 =  2147483648
		0.0 = 0
		positive floats = 1- 2139095039
		+Infinity =  2139095040.
	This method maps
		 -Infinity<----->+Infinity to 0<------>(2^32)-1"
	self > 0.0 ifTrue: [
		^16r80000003 + ((FloatArray basicNew: 1) at: 1 put: self; basicAt: 1) ].
	self < 0.0 ifTrue: [
		^16rFF800000 - ((FloatArray basicNew: 1) at: 1 put: self; basicAt: 1) ].
	self = self ifFalse: [ ^16rFFFFFFFF "NaN" ].
	(self at: 1) = 0 ifTrue: [ ^16r80000003 "Zero" ].
	^16r7F800000 "Negative zero"