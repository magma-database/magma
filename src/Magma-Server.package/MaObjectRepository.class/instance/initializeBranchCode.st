high-availability
initializeBranchCode
	filer initializeBranchCode.
	recoveryManager ifNotNil: [ recoveryManager branchCode: filer branchCode ]