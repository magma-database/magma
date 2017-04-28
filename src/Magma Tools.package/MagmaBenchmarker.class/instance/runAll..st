run
runAll: categoriesArray 
	| answer |
	MagmaPreferences showStatusViaCursor ifTrue: [ MagmaWarning signal: 'MagmaPreferences showStatusViaCursor is turned on, which will dramatically reduce benchmark results.' ].
	answer := WriteStream on: String new.
	self
		 writeContextInformationTo: answer ;
		 initializeFixture.
	session readStrategy: MaReadStrategy deep.
	answer
		 cr ;
		 cr ;
		 nextPutAll: 'Benchmarks:'.
	Smalltalk garbageCollect.
	categoriesArray do:
		[ : each | self
			runCategory: each
			resultsTo: answer ].
	session disconnect.
	answer
		 cr ;
		 cr ;
		 nextPutAll: '*** Client Session Statistics Report ***' ;
		 cr.
	session statistics printReportTo: answer.
	answer
		 cr ;
		 cr ;
		 nextPutAll: '*** Primary Server Statistics Report ***' ;
		 cr.
	session serverStatisticsPrimary printReportTo: answer.
	answer
		 cr ;
		 cr ;
		 nextPutAll: '*** Secondary Server Statistics Report ***' ;
		 cr.
	session serverStatisticsSecondary printReportTo: answer.
	^ answer contents