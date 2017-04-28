test high-availability function
verifyNodeCanMaintain
	"UC 5:  Perform garbage-collection without stopping Node.
	Prestate:  standard HA configuration
	- start client flooding processes
	- fullBackup the primary 'server'
	- Use MagmaCompressor to compress the copy, off-line.
	- Stop existing secondary 'server2' gracefully.  We are down to just the primary 'server' briefly. (In a production world, you would not have to stop the existing server).
	- restart 'server2' on the new compressed backup.
	- 'server2' catches itself back up, reestablishes as a warm-backup.
	- perform same object-structure verifications from prior tests.
	- stop flood progress.
	- verify flood progress.
	Poststate: standard HA configuration
"
	| session verifier |
	MagmaTesterNotification signal: 'Beginning HA Use-Case 5:  Perform garbage-collection without stopping the Node...'.
	self
		setUpForwardRecoveryTest ;
		startClientFloodingProcesses: false.
	self 
		remotePerform: #fullBackupTo:
		with: self maintDirectory pathName
		in: 'client1'.
	self 
		remotePerform: #waitForBackupDone
		in: 'server'.
	
	[ MagmaRepositoryController delete: self compressedRepositoryDirectory pathName ] 
		on: MagmaDeleteWarning
		do: [ : warning | warning resume ].
	(MagmaCompressor source: (MagmaLocalLocation path: self maintDirectory pathName)) compressTo: self compressedRepositoryDirectory pathName.
	self 
		remotePerform: #stopServer
		in: 'server2'.
	self 
		remotePerform: #startServerOnCompressed
		in: 'server2'.
	MagmaTesterNotification signal: 'Waiting for compressed server to catch up.'.
	session := self newSessionAt: self class magmaServerLocation.
	session connectAs: 'compressed repository verifier'.
	[ session isHighlyAvailable ] whileFalse: 
		[ 5 seconds asDelay wait.
		session root ].
	MagmaTesterNotification signal: session printString , ' is now highly-available.'.
	verifier := self class new clientSession: session.
	self restoreVerifications do: 
		[ : each | 
		MagmaTesterNotification signal: 'executing ' , each , ' using session to warm-backup...'.
		verifier perform: each ].
	session disconnect.
	self
		stopFloodProcesses ;
		verifyFloodProgress.
	MagmaTesterNotification signal: 'Completed HA Use-Case 5:  Perform garbage-collection without stopping the Node...'