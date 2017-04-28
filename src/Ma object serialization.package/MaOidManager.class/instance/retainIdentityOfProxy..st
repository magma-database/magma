building
retainIdentityOfProxy: aMaMutatingProxy 
	^ objects 
		at: aMaMutatingProxy maOid
		put: aMaMutatingProxy