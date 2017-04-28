test query cancel
buildLargeMc
	| mc r |
	r := Random seed: Time millisecondClockValue.
	mc := MagmaCollection new
		addIndex: (MaIntegerIndex attribute: #key) ;
		addIndex: (MaIntegerIndex attribute: #value) ;
		yourself.	"ensure we will have duplicates"
	10 thousand timesRepeat: [ mc add: (r nextInt: 5000) -> (r nextInt: 5000) ].
	clientSession 
		setTimeoutSecondsTo: 5*60
		during: 
			[ clientSession commit: 
				[ clientSession root 
					at: #testReleaseReader
					put: mc ] ]