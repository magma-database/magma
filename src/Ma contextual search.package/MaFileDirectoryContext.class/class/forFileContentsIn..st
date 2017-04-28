create
forFileContentsIn: aFileDirectory 
	"Answer a context that will match the specified keywords against the contents of files."
self maMarked: 'dev'. 
"This is unfinished.."
	^ (self new fileDirectory: aFileDirectory)
		accessSelector: #readStream ;
		yourself