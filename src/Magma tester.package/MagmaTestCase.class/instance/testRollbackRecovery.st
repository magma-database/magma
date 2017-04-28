test rollback recovery
testRollbackRecovery
	"- shutdown server.  Wait for shutdown.
	- build a Dictionary of filenames and their contents-hash using SecureHashAlgorithm.
	- simulate an outage in the middle of a juicy commit which includes added and removed keys to an existing MagmaCollection, and MagmaArray, new objects, a new class-def, and a new MagmaCollection (so we test it remove files.
	- wait for server to stop responding
	- restart server image, recovery will happen AUTOMATICALLY!
	- wait for server to respond.
	- shutdown server.
	- use same method to build another Dictionary of the filenames->contents-hashes
	- assert: the first Dictionary = the second."
	| initialHashes postHashes |
	self 
		remotePerform: #buildIndexedMagmaCollectionFrom:at:
		withArguments: { 
				Collection.
				'existing-collection for commitDisaster'
			 }
		in: 'client1'.
	self 
		remotePerform: #buildExistingObjectsForCommitDisaster
		in: 'client2'.
	self 
		remotePerform: #buildMagmaArray
		in: 'client1'.
	self disconnectClients.
	initialHashes := self 
		remotePerform: #captureFileChecksumsWithCopy:
		with: true
		in: 'server'.
	self connectClients.
	self 
		remotePerform: #setSimulateServerOutage:
		withArguments: {  true  }
		in: 'server'.
	self 
		remotePerform: #commitDisaster
		in: 'client2'.
	self waitForServerDown: 'server'.
	(self playerLinkNamed: 'server') disconnect.
	self class launchImageNamed: self class serverImageFilename.
	[ (self playerLinkNamed: 'server') isReady ] whileFalse: 
		[ MagmaTesterNotification signal: 'waiting for server to recover..'.
		(Delay forSeconds: 2) wait ].
	self 
		remotePerform: #startServer:
		with: true
		in: 'server'.
	self 
		remotePerform: #assertPotentiallyOpenSignaled
		in: 'server'.
	postHashes := self 
		remotePerform: #captureFileChecksumsWithCopy:
		with: false
		in: 'server'.
	self assert: initialHashes = postHashes.
	"Since we killed the server, we know we must reconnect the clients."
	self
		disconnectClients ;
		connectClients.
	InitiateBackupPrereqsCompleted add: #testRollbackRecovery