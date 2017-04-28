private
serverSaveAndExit
	"Wait one second to give time for the response to be sent out so the client doesn't get a NetworkError."
	
	[ (Delay forSeconds: 1) wait.
	SmalltalkImage current 
		snapshot: true
		andQuit: true ] fork