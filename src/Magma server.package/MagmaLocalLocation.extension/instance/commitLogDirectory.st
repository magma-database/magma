*magma server
commitLogDirectory
	^ FileDirectory on: (self directory fullNameFor: MaRecoveryManager commitLogDirectoryName)