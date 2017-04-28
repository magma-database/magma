testing
maRequiresOwnBuffer
	^ self maRealObjectIsReified and: [ self realObjectIfMutatingProxy maRequiresOwnBuffer ]