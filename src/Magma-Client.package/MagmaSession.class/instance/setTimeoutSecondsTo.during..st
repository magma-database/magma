accessing
setTimeoutSecondsTo: anInteger during: aBlock 
	"Temporarily adjust my timeoutSeconds for evaluation of aBlock."
	| oldTimeout |
	guard critical: 
		[ oldTimeout := self timeoutSeconds.
		self timeoutSeconds: anInteger.
		[ aBlock value ] ensure: [ self timeoutSeconds: oldTimeout ] ]