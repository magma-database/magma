*magma server
process
	MagmaSession magmaVersion = magmaVersion ifFalse: 
		[ MagmaUserError signal: 'This server is running Magma version ' , MagmaSession magmaVersion printString , '.  You may not connect with version ' , magmaVersion printString , ' of the client code.  You may be able to install the code using browseCode.' ].
	uuid ifNotNil: 
		[ repositoryController magmaId uuid = uuid ifFalse: 
			[ MagmaUserError signal: 'Cannot connect because the repository has been replaced.  Please connect a new session.' ] ].
	commitNumber > 0 ifTrue: 
		[ repositoryController commitNumber < commitNumber ifTrue: 
			[ MagmaWrongCommitNumber signal: 'Cannot connect this session because the repository has been restored to an earlier state.  Please connect a new session.' ] ].
	^ repositoryController 
		newSessionFor: self
		sessionId: sessionId