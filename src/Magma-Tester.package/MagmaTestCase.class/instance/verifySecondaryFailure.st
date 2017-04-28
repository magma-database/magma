test high-availability function
verifySecondaryFailure
	"UC 6:  secondary killed other is primary :
	Prestate:  standard HA configuration
	- clients begin performing rapid sequential add to collections
	- conductor kills secondary.
	- clients don't notice.
	- Verification is performed.
	Poststate:  Primary only"
	| verificationSession lesserSize |
	MaTestCaseNotification signal: 'Beginning HA Use-Case 6:  Secondary failure.'.
	MaTestCaseNotification signal: 'Retesting MagmaStat capability under HA.'.
	self
		 testMagmaStat ;
		 testMisbehavingSession ;
		 setUpForwardRecoveryTest ;
		 startClientFloodingProcesses: false.
	self verifyHandlesFailedServer: 'server2'.
	"For a secondary failure, clients should not even notice."
	verificationSession := self newSessionAt: self class magmaServerLocation.
	verificationSession connectAs: 'check flood processes still running'.
	lesserSize := (verificationSession root at: #testForwardRecovery) first size.
	(Delay forSeconds: 10) wait.
	"Make sure flood processes still progressing after the #takeOverAsPrimary!"
	self assert: (verificationSession refresh root at: #testForwardRecovery) first size > lesserSize.
	verificationSession disconnect.
	self verifyFloodProgress.
	MaTestCaseNotification signal: 'Completed HA Use-Case 6:  Secondary failure.'