test high-availability function
verifyPrimaryFailure
	"UC 2:  primary killed other is secondary :
	Prestate:  standard HA configuration
	- clients are performing rapid sequential add to collections
	- conductor kills primary.
	- clients stop, NetworkError.
	- Verification is performed.
	Poststate:  Secondary became primary"
	MagmaTesterNotification signal: 'Beginning HA Use-Case 2:  Primary failure.'.
	self verifyHandlesFailedServer: 'server'.
	"Clients could not continue with commits, they're done."
	self verifyFloodProgress: self class magmaServer2Location.
	MagmaTesterNotification signal: 'Completed HA Use-Case 2:  Primary failure.'