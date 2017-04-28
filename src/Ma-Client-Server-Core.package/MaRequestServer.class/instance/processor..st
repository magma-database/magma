private
processor: oneArgBlock
	"oneArgBlock takes the request object, answers the response object you want to send back to the client.  For remote, these can only be objects defined in the protocol."

	processor := oneArgBlock