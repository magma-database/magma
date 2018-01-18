printing
oids
	"This method is intended for printing only.  Use instVarsDoWithIndex: if you need to enumerate my oids."

	| oids |
	self objectInstSize isInteger ifFalse: [ ^ '** invalid **' ].
	oids := OrderedCollection new.
	1
		to: self objectInstSize
		do: [ :index | oids add: (self maInstVarAt: index) ].
	^ oids