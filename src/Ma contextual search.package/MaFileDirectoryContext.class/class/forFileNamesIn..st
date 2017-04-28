create
forFileNamesIn: aFileDirectory 
	"Answer a context that will match the specified keywords against the names of files."
	^ self new
		fileDirectory: aFileDirectory ;
		yourself