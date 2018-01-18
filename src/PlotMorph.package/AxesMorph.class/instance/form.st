drawing
form
	form ifNil:
		[ form := Form
			extent: (self bounds insetBy: self borderWidth) extent
			depth: Display depth.
		form fillColor: self color.
		self updateForm ].
	^ form