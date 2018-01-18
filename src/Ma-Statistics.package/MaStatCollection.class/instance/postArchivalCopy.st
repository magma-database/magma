copying
postArchivalCopy
	| historys |
	historys := self historys.
	self class maAllInstVarNamesDo: 
		[ : each | 
		| eachPotentialHistory |
		eachPotentialHistory := self instVarNamed: each.
		(historys includes: eachPotentialHistory) ifTrue: 
			[ self 
				instVarNamed: each
				put: eachPotentialHistory archivalCopy ] ]