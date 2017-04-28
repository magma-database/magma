accessing
directory
	"It's not obvious, but this actually supports fully-qualified paths or relative paths.
		(FileDirectory default on: 'c:\temp') inspect.
		(FileDirectory default on: 'magma') inspect
	"
	^  FileDirectory on: (self base fullNameFor: path) 