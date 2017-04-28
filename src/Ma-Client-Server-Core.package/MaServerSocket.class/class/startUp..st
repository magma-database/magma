initializing
startUp: amResuming
	ActiveSockets do: 
		[ :each | 
		"If another startUp method creates and starts one of me listening, then I don't want to tell it to listen again"
		each isRunning ifFalse: [ each listen ] ]