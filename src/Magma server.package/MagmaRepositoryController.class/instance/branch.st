private
branch
	repository initializeBranchCode.
	self session commit: 
		[ | oldMagmaId |
		oldMagmaId := self definition magmaId.
		self definition initializeMagmaId.
		self definition magmaId
			name: oldMagmaId name ;
			description: oldMagmaId description ]