private
checkIfAmPrimaryOvertaken: portInteger 
	"Check whether I was a primary overtaken by one of my backups and put myself safely into restoreMode if I was.  Even if I was only a secondary, still check the other secondary's to see if any of them is now the primary and note it if they have."
	| thisLocation |
	thisLocation := MagmaRemoteLocation 
		host: NetNameResolver localHostName
		port: portInteger.
	self node secondaryLocationsDo: 
		[ : each | 
		| sess |
		each = thisLocation ifFalse: 
			[ 
			[ sess := (self node sessionFor: each) ensureConnected.
			(sess magmaId = controller session magmaId and: [ sess inRestoreMode not ]) ifTrue: 
				[ controller ensureInRestoreMode.
				"Update the node in memory so #ensureCorrectNodeConfiguration will work correctly.."
				controller magmaId node: sess magmaId node veryDeepCopy	"(so as not to share the same object between sessions)" ] ] 
				on: NetworkError
				do: [ : err | MagmaNodeUpdate signalRemove: each ] ] ]