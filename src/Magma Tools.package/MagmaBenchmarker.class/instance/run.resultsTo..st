run
run: selector resultsTo: aStream 
	aStream
		cr ;
		tab ;
		nextPutAll: selector ;
		nextPutAll: ' : ' ;
		nextPutAll: (self perform: selector).
	"Set each MaHistoricalStat's name to refer to this test, so we can see which test this stat is for."
	session statistics historysDo: 
		[ : eachStatHistory | 
		eachStatHistory isActive ifTrue: [ eachStatHistory active name: selector ] ].
	session statistics transition