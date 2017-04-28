initializing
resetCommitPackage
	commitPackage := MaCommitPackage new.
	"potentialKeyChanges are only ever part of a single commit-package, so reset those too."
	potentialKeysChange := MaIdentityDictionary new