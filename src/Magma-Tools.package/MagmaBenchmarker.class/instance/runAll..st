run
runAll: categoriesArray 
	| answer priorShowStatusSetting |
	"MagmaPreferences showStatusViaCursor is turned on, which will dramatically reduce benchmark results."
	priorShowStatusSetting := MagmaPreferences showStatusViaCursor.
	MagmaPreferences showStatusViaCursor: false.
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
	MagmaPreferences showStatusViaCursor: priorShowStatusSetting.
	^ answer contents