*magma server
process
	| lastCommits sess |
	sess := self node primarySession disconnect.
	lastCommits := sess 
		relinquishPrimaryDutyTo: self thisLocation
		atCommitNumber: repositoryController commitNumber + 1
		branchCode: repositoryController branchCode.
	"Not using #commitRestore because I don't see that we need a new branchCode."
	self repository
		applyCommitRecords: lastCommits ;
		restoreMode: false.
	^ true