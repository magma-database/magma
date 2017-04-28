test high-availability function
verifyQuickSwapFunction
	"UC 4:  intentionally 'swap' servers instantly:
	Prestate:  reversed HA configuration, clients are still flooding from UC3.
	- client sends #takeOverAsPrimary to secondaryServer.
	- System performs a controlled swap while two clients flooding.  Clients will not even notice.
	Poststate:  standard HA configuration"
	| adminSession lesserSize verificationSession |
	MaTestCaseNotification signal: 'Beginning HA Use-Case 4:  Invoke a deliberate takeover of primary duty.'.
	adminSession := self class magmaServerLocation newAdminSession.
	adminSession connectAs: 'admin'.
	self assert: adminSession node primaryLocation = self class magmaServer2Location.
	adminSession takeOverAsPrimary.
	verificationSession := self newSessionAt: adminSession location.
	verificationSession connectAs: 'check flood processes still running'.
	lesserSize := (verificationSession root at: #testForwardRecovery) first size.
	(Delay forSeconds: 30) wait.
	"Make sure flood processes still progressing after the #takeOverAsPrimary!"
	self should: [ (verificationSession refresh root at: #testForwardRecovery) first size > lesserSize ].
	verificationSession disconnect.
	self verifyFloodProgress.
	MaTestCaseNotification signal: 'Completed HA Use-Case 4:  Invokes a deliberate swap of primary duty..'