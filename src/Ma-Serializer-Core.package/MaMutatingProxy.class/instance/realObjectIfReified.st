accessing
realObjectIfReified
	"Only answer my realObject if its reified, otherwise nil."
	^ self maRealObjectIsReified ifTrue: [ self realObjectIfMutatingProxy ]