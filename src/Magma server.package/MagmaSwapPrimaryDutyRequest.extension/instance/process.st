*magma server
process
	^ repositoryController 
		executeSwapWith: newPrimary
		commitNumber: commitNumber
		branchCode: branchCode