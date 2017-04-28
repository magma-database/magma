accessing
waitUpTo: aDuration for: aBlock 
	"Temporarily adjust my timeoutSeconds for evaluation of aBlock."
	| oldTimeout |
	guard critical: 
		[ oldTimeout := self timeoutSeconds.
		self timeoutSeconds: aDuration asSeconds.
		[ aBlock value ] ensure: [ self timeoutSeconds: oldTimeout ] ]