accessing
initializeBranchCode
	| oldBranchCode newBranchCode |
	oldBranchCode := self branchCode.
	[ (newBranchCode := (1 to: (1 bitShift: 32) - 1) atRandom) = oldBranchCode ] whileTrue.
	self branchCode: newBranchCode