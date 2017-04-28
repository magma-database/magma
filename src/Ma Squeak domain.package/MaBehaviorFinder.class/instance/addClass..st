classes
addClass: aClass
	"Adds all methods in aClass"

	aClass selectorsDo:
		[ : each | 
		self addMethod: (MethodReference class: aClass selector: each) ]