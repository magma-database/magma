transactions
commit: aBlock 
	| result |
	guard critical: 
		[ self begin.
		result := aBlock valueWhileObservingStateChange.
		self commit ].
	^ result