high-availability
beWarmBackupFor: primaryLocation 
	"If I am currently started on backup files created from my primary having had sent #fullBackupTo:, which means I should be in restoreMode, then establish a session to primaryLocation and bring my copy of the repository up to date.  Once up to date, the primary server will then broadcast further updates to me in real-time, and instruct clients that I am a warm backup for that primary.  If they detect the primary server is down they will start sending requests to me, at which point I will verify the server availability myself and will, if the connection is refused, #takeOverAsPrimary."
	self isRunning ifFalse: [ MagmaUserError signal: 'Must be running to be a warm backup.' ].
	primaryLocation = self thisLocation ifTrue: [ MagmaUserError signal: 'Please don''t try to be a warm-backup of myself!'].
	[ | primarySession |
	
	[ primarySession := primaryLocation newAdminSession.
	primarySession connectAs: '_beWarmBackupFor'.
	primarySession remoteMagmaId = controller magmaId ifFalse: 
		[ MagmaUserError signal: 'Cannot be a warm backup of ' , primaryLocation printString , ' because I am a totally different repository!' ].
	primarySession inRestoreMode ifTrue: 
		[ MagmaUserError signal: 'Don''t want to be a warm backup of another warm backup.' ].
	primarySession remoteCommitNumber < controller commitNumber ifTrue: 
		[ MagmaUserError signal: 'Cannot be a warm backup of ' , primaryLocation printString , ' because it is behind this repository!' ].
	controller
"		validateLastBranchCodeUsing: primarySession ;"
		ensureInRestoreMode.
	primarySession node ifNotNilDo: [ : node | (node includesSecondary: self thisLocation) ifTrue: [ ^ self ] ] ] ensure: [ primarySession ifNotNil: [ primarySession disconnect ] ].
	controller 
		catch: self thisLocation
		upTo: primaryLocation ] 
		on: NetworkError
		do: 
			[ : err | 
			"Don't do anything.  This server couldn't connect to the primary, but it will sit and wait patiently for the primary to come up.  When it does, it will seek out this server and link up.  If, before then, a client requests this to be the primary, I will become so."
			 ]