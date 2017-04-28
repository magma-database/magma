test high-availability function
verifyRestartFormerPrimary
	"UC 3:  primary started other is primary :
	Prestate:  Secondary became primary.  Old primary will now start back up and:
		- determine it has been 'taken-over', and therefore should reattach itself as a warm-backup.
		- it downloads the commit-log records from the primary, bringing itself up to date.
		- when it catches up, the primary is established in the Node as a warm-backup.
	Poststate:  reversed HA configuration"
	| backupSession |
	MagmaTesterNotification signal: 'Beginning HA Use-Case 3:  A former primary rejoins the node..'.
	"Let's flood with commits while the former primary tries to catch up."
	self
		setUpForwardRecoveryTest ;
		startClientFloodingProcesses: false.
	self launchPrimaryServerPlayer.
	self 
		remotePerform: #startServer:
		withArguments: {  false "don't recover from commit-log files" }
		in: 'server'.
	self 
		remotePerform: #assertPotentiallyOpenSignaled 
		in: 'server'.
	backupSession := self newSessionAt: self class magmaServer2Location.
	backupSession connectAs: 'session waiting for former primary to catch back up'.
	
	[ backupSession
		root ;
		isHighlyAvailable ] whileFalse: 
		[ MagmaTesterNotification signal: 'waiting for reversed HA configuration...'.
		(Delay forSeconds: 5) wait ].
	self assert: backupSession node primaryLocation port = self class defaultServer2Port.
	MagmaTesterNotification signal: 'Completed HA Use-Case 3:  A former primary rejoins the node..'