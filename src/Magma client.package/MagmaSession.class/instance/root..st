private
root: anObject 
	anchor := self anchor.
	anchor root ifNotNil: 
		[ Warning signal: 'Are you sure you want to wipe out the entire database for ' , anObject printString , '?' ].
	guard critical: [ anchor root: anObject ]