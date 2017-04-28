accessing
add: anObject 
	"Put anObject at my next-higher size.  Warning:  Only use this method if you have exclusive access to the receiver."
	^ self
		at: self lastKnownSize + 1
		put: anObject