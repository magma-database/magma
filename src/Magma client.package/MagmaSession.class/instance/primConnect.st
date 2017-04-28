private
primConnect
	| repositoryCommitNumber resultArray startedClientSideConnectionProcessing connectionRequest connectedToPrimary |
	self isConnected ifTrue: [ MagmaUserError signal: 'This session is already connected.' ].
	self statistics ensureActive.
	self isLocal ifTrue: [ self ensureOpen ].
	MagmaNotification signal: 'connecting to ' , self linkInformation , ' as ' , self userId , '...'.
	readStrategy ifNotNil: [ readStrategy beNew ].
	"Calls #newSessionFor:sessionId:."
	connectionRequest := MaRepositoryConnectionRequest new
		uuid: self uuid ;
		commitNumber: self commitNumber ;
		magmaVersion: self class magmaVersion ;
		userId: self userId ;
		sessionId: (id := UUID new) ;
		yourself.
	resultArray := self submit: connectionRequest.
	startedClientSideConnectionProcessing := Time millisecondClockValue.
	self
		loadClassDefinitionsFrom: (resultArray at: 1) ;
		loadDefinitionFrom: (resultArray at: 2).
	repositoryCommitNumber := resultArray at: 3.
	connectedToPrimary := resultArray at: 4.
	"We now have class-defs, make the readStrategy ready in case they've specified one before connection!"
	self prepareReadStrategy.
	"Whichever one we already connected to, connect to the other one, so both servers can have a MagmaClientConnection for this session."
	self isHighlyAvailable ifTrue: 
		[ connectedToPrimary 
			ifTrue: [ self secondarySubmit: connectionRequest ]
			ifFalse: [ self submit: connectionRequest ] ].
	self commitNumber = 0 
		ifTrue: [ self commitNumber: repositoryCommitNumber ]
		ifFalse: 
			[ self statistics refreshAllTimeHistory addValue: (Time millisecondsToRun: [ self refreshTo: repositoryCommitNumber ]) ].
	transaction registerForNotifications.
	self
		initializeSystemChangeNotifications ;
		initializePrimaryLocation.
	self statistics clientSideConnectionTimeHistory addValue: (Time millisecondsSince: startedClientSideConnectionProcessing).
	MagmaNotification signal: 'connection established.'.
	"We've just connected.  If this session *was* in a transaction then begin one on the server."
	self restoreTransaction