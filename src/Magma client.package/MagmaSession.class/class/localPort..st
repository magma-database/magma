creation
localPort: anInteger 
	"Connect to a Magma server running on localhost, listening on port anInteger."
	^ self 
		host: 'localhost'
		port: anInteger