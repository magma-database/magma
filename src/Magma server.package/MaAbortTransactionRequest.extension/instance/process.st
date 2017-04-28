*magma server
process
	| refreshViewResult |
	refreshViewResult := self repository abortTransactionFor: sessionId.
	refreshViewResult addToBeRefreshedWithoutOverwriting: 
		(self repository 
			refreshAll: additionalBuffers
			for: sessionId).
	^ refreshViewResult