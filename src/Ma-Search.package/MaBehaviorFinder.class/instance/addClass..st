classes
addClass: aClass
	"Adds all methods in aClass"

	aClass selectorsDo:
		[ : each | 
		self addMethod: (MaMethodReference class: aClass selector: each) ]