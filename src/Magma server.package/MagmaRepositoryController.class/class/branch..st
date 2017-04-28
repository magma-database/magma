utilities
branch: pathStringOrMagmaLocalLocation 
	"Break the repository at pathStringOrMagmaLocalLocation from its original source (if it was a fullBackup).  The repository will get an entirely new MagmaId and be the only copy of its newly associated MagmaNode, so therefore it won't try to join its old MagmaNode when it starts up.  This allows a 'production copy' to be made and launched in a test environment safely.
	Warning:  Once this is performed, the copy of the repository is like an entirely separate repository and will never again be able to join its source."
	| location controller |
	location := pathStringOrMagmaLocalLocation asMagmaLocalLocation.
	
	[ controller := self open: location.
	controller branch ] ensure: [ controller ifNotNil: [ controller close ] ]