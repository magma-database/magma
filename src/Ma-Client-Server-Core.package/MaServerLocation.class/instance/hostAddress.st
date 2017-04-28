access
hostAddress
	"Answer a ByteArray representing the IP address of my host name."
	^ self isLocalHost 
		ifTrue: [ NetNameResolver localHostAddress ]
		ifFalse: 
			[ [ NetNameResolver 
				addressForName: host
				timeout: 10 ] 
				on: NameLookupFailure
				do: [ : err | nil ] ]