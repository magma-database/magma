*magma-server
shouldServerRefresh
	^ didCommitSpecialOid or: [ commitPackage shouldServerRefresh ]