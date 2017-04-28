*magma-server-actions
detachFromNode
	"Normally sent to location of a local backup.  Resets it's node so it can be used independently."
	| sess |
	sess := self newSession
		 connectAs: 'resetNode' ;
		 yourself.
	sess repositoryController restoreMode ifTrue: [ sess repositoryController commitRestore ].
	[ sess resetNode ] ensure: [ sess disconnectAndClose ].
	MagmaNotification signal: self maAbbreviatedString , ' is now detached.  Commit-log files from the original repository can no longer be used to roll it forward.'