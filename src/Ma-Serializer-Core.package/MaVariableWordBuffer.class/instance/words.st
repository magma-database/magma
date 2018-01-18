printing
words
	"This is intended for printing only."
	self objectInstSize isInteger ifFalse: [ ^ '** invalid **' ].
	^ (1 to: self objectInstSize) collect: [ : index | self maInstVarAt: index ]