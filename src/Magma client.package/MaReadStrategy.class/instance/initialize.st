private
initialize

	super initialize.
	"depths:  key is converted to the classId, value is either
	anInteger for depth of all instVars or an Array detailing the
	depth of each instVar."
	self 
		resetDepths ;
		initializeDefaultSpecifications