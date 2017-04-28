building
className: newClassName

	self className ifNotNil: [ aliases add: self className ].
	super className: newClassName