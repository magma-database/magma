copying
postArchive: aTimespan 
	| historys |
	historys := self historys.
	self class maAllInstVarNamesDo: 
		[ : each | 
		| eachPotentialHistory |
		eachPotentialHistory := self instVarNamed: each.
		(historys includes: eachPotentialHistory) ifTrue: 
			[ self 
				instVarNamed: each
				put: (eachPotentialHistory archive: aTimespan) ] ].
	self noteNewSpan: aTimespan