enumerating
withIndexDo: elementAndIndexBlock 
	| x |
	x := 0.
	self do: 
		[ : each | 
		elementAndIndexBlock 
			value: each
			value: (x := x + 1) ]