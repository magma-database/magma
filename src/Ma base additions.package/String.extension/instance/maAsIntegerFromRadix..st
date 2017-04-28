*ma base additions
maAsIntegerFromRadix: anInteger
	"Answer a Smalltalk Integer with an equivalent value of the receiver
	represented in radix anInteger."

	^self
		inject: 0
		into: [ :sum :character | (sum * anInteger) + character digitValue ]
