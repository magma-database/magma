high-availability
relinquishPrimaryDutyTo: secondaryLocation atCommitNumber: commitNumber branchCode: branchCode
	self ensureIsAdminSession.
	"Calls #executeSwapWith:commitNumber:branchCode:."
	^ self submit:
		(MagmaSwapPrimaryDutyRequest new
			newPrimary: secondaryLocation ;
			commitNumber: commitNumber ;
			branchCode: branchCode ;
			yourself)