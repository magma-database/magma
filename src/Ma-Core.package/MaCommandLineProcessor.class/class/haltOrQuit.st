private
haltOrQuit
	(QuitOnError or: [ Smalltalk isHeadless ])
		ifTrue: [ self quit ]
		ifFalse: [ self halt ]