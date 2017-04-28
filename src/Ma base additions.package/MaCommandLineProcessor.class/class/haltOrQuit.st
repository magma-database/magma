private
haltOrQuit
	SmalltalkImage current maIsHeadless
		ifTrue: [ self quit ]
		ifFalse: [ self halt ]