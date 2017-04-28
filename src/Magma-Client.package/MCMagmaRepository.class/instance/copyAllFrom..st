private
copyAllFrom: aMCRepository 
	"Copy all MCVersions from aMCRepository to the receiver."
	session timeoutSeconds: 300.
	super copyAllFrom: aMCRepository.
	self trim