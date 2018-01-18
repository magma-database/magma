access
resetDelay
	"If I am still counting down to ding, reset my Delay timer back to the original duration.  Otherwise, do nothing.  
	This might make me useful as a countdown timer to disconnect after a period of inactivity."
	self started ifFalse: [ ^ self ].	"not yet started.."
	monitor critical: [ delay ifNotNil: [ delay maReset ] ]