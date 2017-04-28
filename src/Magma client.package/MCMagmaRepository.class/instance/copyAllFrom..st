private
copyAllFrom: aMCRepository 
	"Copy all MCVersions from aMCRepository to the receiver."
	super copyAllFrom: aMCRepository.
	self trim