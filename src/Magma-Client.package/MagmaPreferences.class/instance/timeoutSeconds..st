accessing
timeoutSeconds: anInteger 
	"The number of seconds to wait for requests that cannot retry."
	self
		attributeNamed: #timeoutSeconds
		put: anInteger