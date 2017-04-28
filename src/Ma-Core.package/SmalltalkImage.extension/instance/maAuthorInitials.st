*ma-core
maAuthorInitials
	^ (Smalltalk hasClassNamed: #Utilities)
		ifTrue:
			[ | init |
			init := (Smalltalk classNamed: #Utilities) authorInitialsPerSe.
			init isEmptyOrNil
				ifTrue: [ 'unknown' ]
				ifFalse: [ init ] ]
		ifFalse: [ 'unknown' ]