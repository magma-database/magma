remember/restore
restoreAttributes
	"Restore my prior-attributes which were remembered via #rememberAttributes."
	attributes 
		at: #priorAttributes
		ifPresent: [ : foundAttributes | attributes := foundAttributes ]
		ifAbsent: 
			[ "there were no attributes when rememberAttributes was called"
			 ]