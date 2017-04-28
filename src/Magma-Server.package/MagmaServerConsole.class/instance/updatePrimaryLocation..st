private
updatePrimaryLocation: portInteger 
	"When I'm started up, update the primaryLocation to this location, if it has changed."
	self restoreMode ifFalse: 
		[ "We can't simply use #thisLocation because we aren't running yet (so no port)!"
		| primaryLoc thisLoc |
		thisLoc := MagmaRemoteLocation 
			host: NetNameResolver localHostName
			port: portInteger.
		primaryLoc := self node primaryLocation.
		(primaryLoc isNil or: 
			[ primaryLoc isLocal or: [ primaryLoc isLocalHost not or: [ primaryLoc ~= thisLoc ] ] ]) ifTrue: [ controller session commit: [ self node primaryLocation: thisLoc ] ] ]