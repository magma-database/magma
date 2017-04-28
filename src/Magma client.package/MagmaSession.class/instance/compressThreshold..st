performance
compressThreshold: anInteger 
	"The maximum number of bytes a request will be before the client decides it should be compressed."
	^ primaryLink compressThreshold: anInteger