test high-availability function
verifyPrimaryFailure
	"UC 2:  primary killed other is secondary :
	Prestate:  standard HA configuration
	- clients are performing rapid sequential add to collections
	- conductor kills primary.
	- clients continue committing to secondary.
	- Verification is performed.
	Poststate:  Secondary became primary"
	MaTestCaseNotification signal: 'Beginning HA Use-Case 2:  Primary failure.'.
"Might be good to actually verify clients are still adding strings here by connecting a separate session and observing the string collections increasing in size."
	self
		 verifyHandlesFailedServer: 'server' ;
		 stopFloodProcesses ;
		 verifyFloodProgress: self class magmaServer2Location.
	MaTestCaseNotification signal: 'Completed HA Use-Case 2:  Primary failure.'