transactions
commit: aBlock 
	| result |
	guard critical: 
		[ self begin.
		result := aBlock value.
		self commit ].
	^ result