accessing
externalName
	^ super externalName ,
		(title contents isEmpty
			ifTrue: [ String empty ]
			ifFalse: [ ' - ' , title contents ])