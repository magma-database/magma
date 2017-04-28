notifications
noteException: anException onSocket: aMaRequestLifecycle 
	"anException was signaled when trying to read from aSocket.  Maybe they disconnected?"
	self
		newLine ;
		showSocket: aMaRequestLifecycle socket ;
		showSeparator ;
		showMessage: (anException messageText isEmpty 
				ifTrue: [ anException species name ]
				ifFalse: [ anException messageText ])