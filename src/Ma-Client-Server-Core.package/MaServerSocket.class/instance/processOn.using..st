start/stop
processOn: portNumber using: oneArgBlock 
	"Listen on portNumber, for each ByteArray request received answer the value of oneArgBlock (which should answer a ByteArray)."
	doBlock := oneArgBlock.
	self processOn: portNumber