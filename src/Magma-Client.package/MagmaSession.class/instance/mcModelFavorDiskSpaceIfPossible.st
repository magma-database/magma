private
mcModelFavorDiskSpaceIfPossible
	[ self mcModel favorDiskSpace.
	MagmaNotification signal: 'Was able to favorDiskSpace.  This might be the first codeBackup and therefore might take a long time.' ]
		on: MagmaUserError
		do:
			[ : err | "Ok, this permanent preference was already set."
			err ]