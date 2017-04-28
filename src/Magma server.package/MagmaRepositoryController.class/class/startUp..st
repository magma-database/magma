initializing
startUp: amResuming 
	OpenControllers copy do: 
		[ : each | 
		
		[ [ each ensureOpen ] 
			on: MagmaNotification
			do: 
				[ : noti | 
				Transcript
					cr ;
					show: noti messageText.
				noti resume ] ] 
			on: MagmaEnvironmentError
			do: 
				[ : error | 
				"not present anymore, remove from OpenControllers and resignal."
				each close.
				error pass ] ].
	"Now that we're open, ensure any server-sockets that may need to restart can be."
	MaServerSocket startUp: amResuming