*magma-server-accessing
commitLogDirectory
	^ FileDirectory on: (self directory fullNameFor: MaRecoveryManager commitLogDirectoryName)