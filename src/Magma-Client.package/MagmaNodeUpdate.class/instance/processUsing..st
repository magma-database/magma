accessing
processUsing: aMagmaServerConsole 
	"Apply my updates to the node in a transaction.  Then ensure a correct node configuration."
	| session node oldBranchCode canSkipReconfigure |
	session := aMagmaServerConsole serverSession.
	node := aMagmaServerConsole node.
	canSkipReconfigure := self isOnlyRemoving and: [ node includesSecondary: remove ].
	
	[ 
	[ self wantsNewPrimary ifTrue: 
		[ "Can't do a commit if you're not the primary, gotta bite the bullet."
		oldBranchCode := aMagmaServerConsole controller branchCode.
		aMagmaServerConsole controller commitRestore ].
	session commit: [ self applyTo: node ] ] 
		on: MagmaCommitError
		do: 
			[ : err | 
			session abort.
			oldBranchCode ifNotNil: 
				[ "Ahhhh, go back!  We didn't actually commit anything so it should be safe."
				aMagmaServerConsole controller
					branchCode: oldBranchCode ;
					beginRestore ] ] ] ensure: 
		[ "This is needed whether commit-error occurs or not"
		"But, if only removing a secondary, we don't need to "
		canSkipReconfigure ifFalse: [ aMagmaServerConsole ensureCorrectNodeConfiguration ] ]