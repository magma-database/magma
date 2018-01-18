private
waitForAvailableCore
	| availableCore |
	[ availableCore := guard critical: [ cores indexOf: nil ].
	availableCore = 0 ] whileTrue:
		[ (Delay forSeconds: 2) wait.  "Balance between cost of making connections and wait-time to launch next batch of available cores."
		self recoverFinishedCores ].
	^ availableCore