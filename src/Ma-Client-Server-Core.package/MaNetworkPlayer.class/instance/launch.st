client side
launch
	"Launch players minimized.  Use the fully-qualified path to the vm, specify memory and iconic, then the image name with two args:  the port and the name of this Player in single-quotes.  Finally, append output to .log and .err files."
	| displayType | displayType := Smalltalk isHeadless ifTrue: [ 'none' ] ifFalse: [ 'X11 -iconic' ].
	OSProcess command: Smalltalk vmFileName, ' -vm display=', displayType, ' ' , self imageName, ' ', self port asString, ' ''', name , ''' > ' , name , '.log 2>' , name , '.err &'