creation
for: pathStringOrMagmaLocalLocation
	^ self new 
		directory: (pathStringOrMagmaLocalLocation asMagmaLocalLocation directory)
		yourself