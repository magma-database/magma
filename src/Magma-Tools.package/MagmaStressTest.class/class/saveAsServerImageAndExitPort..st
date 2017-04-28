run
saveAsServerImageAndExitPort: portInteger 
	| console |
	self saveAndExitAs: '_stressTestServer' , portInteger asString.
	console := MagmaServerConsole new.
	"Capture stats minute-by-minute for the last week."
	console statistics snapshotInterval: (1 to: 60 * 24 * 7 by: 1).
	console
		open: MagmaStressTest dbName , portInteger asString ;
		processOn: portInteger ;
		useCompression: false.
	portInteger = self port ifTrue: 
		[ (Delay forSeconds: 6) wait. console controller fullBackupToServerPath: 'stressTest' , (portInteger + 1) asString ].
	"Reference globally to eliminate chance of garbage-collect."
	console inspect