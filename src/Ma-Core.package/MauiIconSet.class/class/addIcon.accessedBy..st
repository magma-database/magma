more icons
addIcon: aFormOrSketchMorph accessedBy: selector 
	"Compile a new 'access' method in me that will answer aFormOrSketchMorph as an icon."
	self 
		compile: 
			(self 
				methodSourceForIcon: aFormOrSketchMorph form
				named: selector)
		classified: 'icons'