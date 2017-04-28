*ma base additions
maIsLocalHost
	"Host addresses are represented as ByteArray's in Squeak.  Answer whether this host-address represents a localhost address."
	"Efficiently check whether the initial host-address is 127, which is assumed to be the localhost."
	self maAsIpString in: 
		[ : str | 
		(str first = $1 and: [ str second = $2 and: [ str third = $7 ] ]) ifTrue: [ ^ true ] ].
	^ self = NetNameResolver localHostAddress