private
ensureStartedUp: className 
	(Smalltalk hasClassNamed: className) ifTrue: [ (Smalltalk classNamed: className) startUp: true ]