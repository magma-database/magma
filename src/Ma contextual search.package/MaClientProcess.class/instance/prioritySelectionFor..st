private
prioritySelectionFor: priorityInteger 
	^ self mauiClientProcessPriorities 
		at: priorityInteger / 10 - 2
		ifAbsent: [ priorityInteger asString ]