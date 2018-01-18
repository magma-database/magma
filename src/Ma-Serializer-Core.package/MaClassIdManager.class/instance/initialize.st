private
initialize
	super initialize.
	idsByClass := Dictionary new.
	classesById := Dictionary new.
	nextClassId := self initialClassId.
	inImageDefinitions := Dictionary new.
	mutable := true.
	self classDefinitionsById: Dictionary new.
	self initializeMinimumClasses