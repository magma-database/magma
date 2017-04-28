*magma-tester
initializeTimeoutSeconds
	self timeoutSeconds:
		(MagmaPreferences debug
			ifTrue: [ "2 days" 172800 ]
			ifFalse: [ 30 ])