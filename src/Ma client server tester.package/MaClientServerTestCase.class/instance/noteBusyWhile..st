shared
noteBusyWhile: aBlock 
	
	[ busy := true.
	aBlock value ] ensure: [ busy := false ]