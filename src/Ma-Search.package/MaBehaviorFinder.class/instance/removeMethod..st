methods
removeMethod: aMethodReference 
	methods 
		remove: aMethodReference
		ifAbsent: 
			[ "don't complain"
			 ].
	self invalidateCache