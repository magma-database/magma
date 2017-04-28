creation
newPersons: anInteger
	"Answer a collection of anInteger number of MagmaPerson's."

	| names addresses persons |
	persons := OrderedCollection new: anInteger.
	names := self newPersonNames: anInteger.
	addresses := self newMailingAddresses: anInteger.
	names
		with: addresses
		do:
			[ :eachName :eachAddress |
			persons add: (
				(Smalltalk classNamed: #MagmaPerson) new
					name: eachName ;
					address: eachAddress ;
					yourself) ].
	^ persons