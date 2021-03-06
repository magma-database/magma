test high-availability function
verifyAddToNode
	"HA Use-Case 1:  secondary started other is primary :
	Prestate:  Primary only
	- secondary server started on 51970
	- secondary catches itself up to primary
	- primary adds secondary as a warm-backup
	Poststate:  standard HA configuration, 51969:51970
"
	"A backup was performed a long time ago at the beginning of the test suite (see #initiateBackupIfTime).  Since then, commit.log files have been written.  Now we will start a server on that backup and apply those backup records and verify lots of things are correct in the restored object model."
	| backupSession verifier |
	self
		setUpForwardRecoveryTest ;
		startClientFloodingProcesses: true.
	MagmaTesterNotification signal: 'Beginning HA Use-Case 1:  Add a server to the Node.'.
	self class 
		addPlayerNamed: 'server2'
		at: 'localhost'
		port: 1317.
	self 
		remotePerform: #startServer2
		in: 'server2'.
	backupSession := self newSessionAt: self class magmaServerLocation.
	backupSession connectAs: 'restore verifier'.
	[ backupSession isHighlyAvailable ] whileFalse: 
		[ MagmaTesterNotification signal: 'waiting for standard HA configuration...'.
		(Delay forSeconds: 10) wait.
		backupSession root ].
	MagmaTesterNotification signal: backupSession printString , ' is now highly-available...'.
	self ensureClientsHighlyAvailable.
	"We are connected to the entire node, so we can do an abort without error."
	backupSession abort.
	verifier := self class new clientSession: backupSession.
	self restoreVerifications do: 
		[ : each | 
		MagmaTesterNotification signal: 'executing ' , each , ' using session to warm-backup...'.
		verifier perform: each ].
	backupSession disconnect.
	MagmaTesterNotification signal: 'Completed HA Use-Case 1.'