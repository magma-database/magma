scan
refresh
	didRefresh 
		ifTrue: 
			[ "If already refreshed, tell them all to reset.  Their scans will pick up again when the individual contexts are accessed."
			subcontexts do: 
				[ : each | 
				each
					stopScanning ;
					resetResults ] ]
		ifFalse: [ didRefresh := true ]