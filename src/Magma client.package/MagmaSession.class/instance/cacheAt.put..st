accessing
cacheAt: nameString put: anObject 
	"Reference anObject at nameString to prevent it from being garbage-collected.  This is used for remote-performing on the server."
	^ cache 
		at: nameString
		put: anObject