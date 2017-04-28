accessing
userId: aString
	"Convenience method for setting userId, arbitrarily required by Magma.  Creating a session and setting the user is a more lazy way to access repositories, vs. a direct #connectAs:."
	self user: (MagmaUser id: aString)