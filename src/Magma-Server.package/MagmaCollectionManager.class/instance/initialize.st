initialize-release
initialize
	super initialize.
	"we need them mapped to the correct attribute."
	oidIndexesByAttribute := Dictionary new.
	keyIndexesByAttribute := Dictionary new.
	"and we must know the correct order, as well"
	oidIndexes := OrderedCollection new.
	keyIndexes := OrderedCollection new