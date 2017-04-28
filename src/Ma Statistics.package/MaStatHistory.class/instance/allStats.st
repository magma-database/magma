accessing
allStats
	^ self guard critical: 
		[ history , 
		(self isActive 
				ifTrue: [ Array with: active ]
				ifFalse: 
					[ #() ]) ]