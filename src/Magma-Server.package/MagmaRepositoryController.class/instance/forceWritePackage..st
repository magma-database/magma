private
forceWritePackage: aMaCommitPackage 
	"This is somewhat of a hacking method to enable us to write objects needed
	for the repository to operate (i.e., commit transactions) during initial creation."
	^ 
	[ repository 
		submitAll: aMaCommitPackage
		for: session id
		beginAnother: false ] ensure: [ session decrementTransactionLevel ]