enumerating
reject: aBlock 
	"Answer the Set of my elements which do not satisfy aBlock."
	| answer |
	answer := self maOriginalClass new.
	self do: [ : each | (aBlock value: each) ifFalse: [ answer add: each ] ].
	^ answer