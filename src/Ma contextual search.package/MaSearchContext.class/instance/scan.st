private
scan
	| progress description |
	progress := scanProcess progressor.
	progress
		description: 'scanning for ' , self keywordsSelection ;
		unitsVerbPhrase: 'objects scanned'.
	self knowsSearchSize ifTrue: [ progress taskSize: self searchSize ].
	self
		resetResults ;
		primScan.
	description := scanProcess shouldStop 
		ifTrue: [ 'stopped' ]
		ifFalse: 
			[ self atEnd 
				ifTrue: [ 'scanning complete' ]
				ifFalse: 
					[ scanProcess progressor runningTime > (self preferred: #maximumScanTime) 
						ifTrue: [ 'timed out' ]
						ifFalse: [ 'max results found' ] ] ].
	progress description: description