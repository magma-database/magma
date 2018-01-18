initialize
doBlock: aBlock 
	process := ([ : proc | [ aBlock argumentCount isZero
		ifTrue: [ aBlock value ]
		ifFalse: [ aBlock value: proc ] ] ensure:
		[ self stopped
			ifTrue: [ self signalWaiterOnStop ]
			ifFalse: [ progressor stop ] ] ] newProcessWith: {self}) priority: Processor userBackgroundPriority