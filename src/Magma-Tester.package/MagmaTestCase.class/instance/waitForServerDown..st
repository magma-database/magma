test rollback recovery
waitForServerDown: serverNameString 
	| player |
	player := suite orchestra playerNamed: serverNameString.
	[ (Delay forSeconds: 2) wait.
	player isReady ] whileTrue: [ MaTestCaseNotification signal: 'Waiting for server to shutdown..' ]