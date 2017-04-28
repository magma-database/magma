private
mcModelFavorDiskSpaceIfPossible
	self isConnected ifFalse: [ self connectAs: 'fullBackup' ].
	[ self mcModel favorDiskSpace ]
		on: MagmaUserError
		do:
			[ : err | "Ok, this permanent preference was already set."
			err ]