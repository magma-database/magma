accessing
summary
	^ self guard critical: 
		[ summary ifNil: 
			[ summary := MaHistoricalStat name: 'Totals for ' , name , ':'.
			history do: [ : each | summary := summary + each ].
			self isActive ifTrue: [ summary := summary + active copy ].
			summary ] ]