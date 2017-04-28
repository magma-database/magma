high-availability
takeOverAsPrimary
	self isLocal ifTrue: 
		[ MagmaUserError signal: 'Only applicable for multiserver on-line nodes.' ].
	self ensureIsAdminSession.
	"Calls #relinquishPrimaryDutyTo:atCommitNumber:branchCode:, but also see the process method."
	^ self submit: MagmaRequestSwapPrimaryDutyRequest new