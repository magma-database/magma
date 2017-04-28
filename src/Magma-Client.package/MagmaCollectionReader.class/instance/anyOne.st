accessing
anyOne
	^ self isLoaded 
		ifTrue: [ segment objects anyOne value ]
		ifFalse: [ self first ]