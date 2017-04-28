*ma-client-server-core
restartSigTermHandler
	SigTermHandler ifNotNil: [ SigTermHandler terminate ].
	SigTermHandler := [ (Smalltalk classNamed: #OSProcess) accessor restoreSigTerm.
	(Smalltalk classNamed: #OSProcess) accessor forwardSigTerm wait.
	FileStream stdout nextPutAll: 'SIGTERM received, shutting down gracefully.'; flush.
	Smalltalk
		snapshot: false
		andQuit: true ] newProcess
		 name: 'Waiting for SIGTERM for graceful shutdown' ;
		 resume