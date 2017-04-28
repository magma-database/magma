initialize-release
initialize
	super initialize.
	localRoot := Dictionary new.
	timeToVerifyRestore := false.
	forwardRecoverySignaled := potentiallyOpenSignaled := shouldStopFlooding := false.
	blockTestFixture := { 'hello' }