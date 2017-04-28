accessing
secondaryLocationsDo: oneArgBlock 
	| locCopy |
	locCopy := locations copy.	"in case user wants to remove them"
	2 
		to: locCopy size
		do: [ : n | oneArgBlock value: (locCopy 
				at: n
				ifAbsent: [ ^ self ]) ]