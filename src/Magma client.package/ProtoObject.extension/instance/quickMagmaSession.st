*magma client
quickMagmaSession
	"Answer the connected MagmaSession that the receiver was retrieved in.  If I am not an object retrieved from any connected session, answer nil."
	^ MagmaSession connectedSessions 
		detect: [ : each | each isPersistent: self ]
		ifNone: [ nil ]