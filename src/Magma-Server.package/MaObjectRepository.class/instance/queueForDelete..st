actions
queueForDelete: aMaAtomicFileStream 
	"When removing indexees, we actually remove the supporting file.  However, we don't want to do that until the commit actually succeeds.  Therefore, we a queue the files to deleted until the commit succeeds, then we delete it."
	recoveryManager queueForDelete: aMaAtomicFileStream