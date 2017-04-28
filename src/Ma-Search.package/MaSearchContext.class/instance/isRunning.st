testing
isRunning
	"Answer whether I am scanning right now."
	^ scanProcess notNil and: [ scanProcess isRunning ]