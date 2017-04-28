*magma-server
shouldBeSecondary
	"This request should only run on the secondary server.  If I am not in restoreMode (the primary) then ping the primary to see whether it is still there.  If it isn't, take over, otherwise signal a MagmaWrongServerError back to the client."
	| session |
	self isPrimary ifTrue: 
		[ (failedLocation isNil or: [ (self node secondaryLocations includes: failedLocation) not ]) ifTrue: 
			[ MagmaWrongServerError new
				correctServer: self node anySecondaryLocation ;
				signal ].
		session := self node sessionFor: failedLocation.
		console removeSecondaryLocation: failedLocation.
		[ session beWarmBackupFor: self thisLocation ] 
			on: NetworkError
			do: 
				[ : err | 
				"It really is down, don't do anything."
				 ] ]