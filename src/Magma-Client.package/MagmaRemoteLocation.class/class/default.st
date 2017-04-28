create
default
	"For Seaside support."
	self maMarked: 'otherPackageSupport'.
	^ self 
		host: 'localhost'
		port: 51969