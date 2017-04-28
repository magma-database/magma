framework
setUpSuite
	self validateProtocol.
	MagmaRepositoryDefinition runningTestCases: true.
	MagmaSession cleanUp.
	^ super setUpSuite