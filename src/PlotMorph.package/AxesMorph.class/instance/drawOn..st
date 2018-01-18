drawing
drawOn: aCanvas 
	super drawOn: aCanvas.
	aCanvas
		image: self form
		at: self topLeft + self borderWidth
		rule: Form blend