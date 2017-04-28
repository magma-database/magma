actions
addAll
	"Selects all methods in the image."
	| count |
	'Adding all code-elements...'
		displayProgressFrom: (count := 0)
		to: self systemNavigation maNumberOfClasses
		during:
			[ : bar | self systemNavigation allClassesDo:
				[ : each | bar value: (count := count + 1).
				self
					 addClass: each ;
					 addClass: each class ] ]