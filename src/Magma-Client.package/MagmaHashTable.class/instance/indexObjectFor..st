private
indexObjectFor: anObject
	^ anObject realObjectIfMutatingProxy perform: index attribute realObjectIfMutatingProxy