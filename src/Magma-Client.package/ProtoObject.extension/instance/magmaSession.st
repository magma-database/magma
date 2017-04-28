*magma-client
magmaSession
	"Answer the connected MagmaSession that the receiver was retrieved in.  If I am not an object retrieved from any session, answer nil."
	^ self quickMagmaSession ifNil:
		[ MagmaSession allClientInstances
			detect: [ : each | each isPersistent: self ]
			ifNone: [ nil ] ]