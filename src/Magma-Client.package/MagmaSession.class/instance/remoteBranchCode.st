accessing
remoteBranchCode
	"The branchCode is a private, internal Magma field used to identify whenever a backup copy of a repository is switched out of restoreMode.  Such a repository is now a 'branch' and can never again receive updates from its ancestral repository."
	^ self remotePrimitiveAttributes at: #branchCode