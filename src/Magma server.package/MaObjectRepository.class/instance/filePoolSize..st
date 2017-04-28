accessing
filePoolSize: anInteger 
	"Set the maximum number of simultaneously-open files that Magma will have."
	anInteger < 4 ifTrue: [ MagmaUserError signal: 'Magma requires at least 4 open files.' ].
	filePool maxSize: anInteger - 4	"-4 : 1 for objects file, 1 for file-positions index, 2 for recovery files."