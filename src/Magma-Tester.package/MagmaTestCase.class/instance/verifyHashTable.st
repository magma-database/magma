test MagmaHashTable
verifyHashTable
	| tbl |
	clientSession refresh.
	tbl := clientSession root at: #testMagmaHashTable.
	self assert: tbl notEmpty.
	self hashTableKeys do:
		[ : each | | all |
		all := tbl allAt: each.
		each =
			(DateAndTime
				year: 1969
				month: 5
				day: 10
				hour: 11
				minute: 52)
			ifTrue:
				[ self
					 assert: all size = 2 ;
					 assert: all asSet size = 1 ;
					 assert: all anyOne = (self hashTableKeys second -> self hashTableKeys second printString) ]
			ifFalse:
				[ self
					 assert: all size = 1 ;
					 assert: all anyOne = (each -> each printString) ] ]