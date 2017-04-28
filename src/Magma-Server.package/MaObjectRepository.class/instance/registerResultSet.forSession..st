magma-collections
registerResultSet: aMaCommitPackage forSession: sessionId 
	"Write buffers for aMaCommitPackage and its indexes collection so that, in case it becomes persistently referenced."
	self session begin.	"Begin a tran to allow the submitAll:for:.."
	^ repositoryController forceWritePackage: aMaCommitPackage