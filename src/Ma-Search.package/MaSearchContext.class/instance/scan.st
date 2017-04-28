private
scan
	| description |
	scanProcess
		description: 'scanning for ' , self keywordsSelection ;
		unitsVerbPhrase: 'objects scanned'.
	self knowsSearchSize ifTrue: [ scanProcess unitsCompleted: 0; taskSize: self searchSize ].
	self
		resetResults ;
		primScan.
	description := scanProcess stopped
		ifTrue: [ 'stopped' ]
		ifFalse: 
			[ self atEnd 
				ifTrue: [ 'scanning complete' ]
				ifFalse: 
					[ scanProcess runningTime > (self preferred: #maximumScanTime) 
						ifTrue: [ 'timed out' ]
						ifFalse: [ 'max results found' ] ] ].
	scanProcess description: description