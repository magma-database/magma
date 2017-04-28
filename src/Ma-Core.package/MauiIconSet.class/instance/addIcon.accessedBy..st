accessing
addIcon: aFormOrSketchMorph accessedBy: selector 
	"Compile a new 'access' method in me that will answer aFormOrSketchMorph as an icon."
	self class
		addIcon: aFormOrSketchMorph
		accessedBy: selector.
	self changed: #icons