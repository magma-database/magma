classes
removeClass: aClass 
	"Adds all methods in aClass"
	aClass selectorsDo: 
		[ : each | 
		self removeMethod: 
			(MethodReference 
				class: aClass
				selector: each) ]