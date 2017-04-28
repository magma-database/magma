accessing
applyTo: aMagmaNode 
	"Make updates to the aMagmaNode."
	remove ifNotNil: 
		[ aMagmaNode removeLocation: remove
		"Check node is production-capable (i.e., at least two locations in the node)." ].
	add ifNotNil: [ aMagmaNode addLocation: add ].
	setPrimary ifNotNil: [ aMagmaNode primaryLocation: setPrimary ]