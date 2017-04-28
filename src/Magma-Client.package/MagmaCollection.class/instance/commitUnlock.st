private
commitUnlock

	[ session commit: [ self unlock ] ]
		on: MagmaCommitError
		do:
			[ :error |
			error messageText:
				error messageText,
				'Abnormal condition.  The enumeration completed, but your session was unable to unlock the collection.  No one can update the collection until it is unlocked.  ' ]