start / stop
launch
	"Players treat first command-line args as a port number, not a script."
	players ifEmpty: [ MaClientServerUserError signal: 'No players.  Launching is useless.' ].
	"Allow multiple parameters, don't assume a .st file input."
	Preferences readDocumentAtStartup: false.
	MCFileBasedRepository flushAllCaches.
	Smalltalk saveAs: self conductorImageName.
	imageTimestamp := Smalltalk imageEntry modificationTime.
	"v------ Players continue here -----v"
	self isConductorImage ifTrue:
		[ startBlock value.
		"fork it to allow UI control so that the conductor image itself can be a user-console which can interactively display status of currently running players even though not all players have yet been launched."
		onePlayerImage ifTrue: [ players anyOne prepareImage ].
		launchProcess := [ players withIndexDo:
			[ : each : index | | availableCore |
			availableCore := self waitForAvailableCore.
			guard critical:
				[ cores
					at: availableCore
					put: #notReady -> each ].
			each initializeLink: firstPort + availableCore - 1.
			onePlayerImage ifFalse: [ each prepareImage ].
			[ each
				 launch ;
				 waitForReady.
			guard critical:
				[ cores
					at: each port - firstPort + 1
					put: each ] ] newProcess name: 'launching ', each name; resume ] ] newProcess
			 name: name , ' conductor' ;
			 resume ].
	"Players, start your servers and go!"
	self homePlayer ifNotNil:
		[ : hp | hp go ]