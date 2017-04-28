*magma-client
magmaBuffer
	"The database buffer representing this object."
	^ self magmaSession ifNotNil:
		[ : sess | sess bufferFor: self ]