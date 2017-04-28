initialize-release
initialize
	super initialize.
	referencedClasses := Set new.
	referencedCollections := Set new.
	upgradeBlock := [ : eachBuffer | eachBuffer ].
	process := MaClientProcess new