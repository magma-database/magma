accessing
yourself
	"Short-cut to the object, rather than going through doesNotUnderstand:."
	session forceClean.
	^ self realObjectIfMutatingProxy 