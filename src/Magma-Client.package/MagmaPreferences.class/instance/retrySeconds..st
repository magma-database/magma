accessing
retrySeconds: anInteger 
	"For requests that can retry, the number of seconds to wait before retrying."
	self
		attributeNamed: #retrySeconds
		put: anInteger