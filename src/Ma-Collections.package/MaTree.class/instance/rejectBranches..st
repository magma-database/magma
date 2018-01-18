enumerating
rejectBranches: aBlock 
	"Returns a new Tree without my branches that satisfy aBlock."
	| newTree |
	newTree := self maOriginalClass new.
	self do: [ : each | (aBlock value: each) ifFalse: [ newTree mergePath: (self pathTo: each) ] ].
	^ newTree