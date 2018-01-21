classes
removeClass: aClass 
	"Adds all methods in aClass"
	aClass selectorsDo: 
		[ : each | 
		self removeMethod: 
			(MaMethodReference 
				class: aClass
				selector: each) ]