test backup/restore
backupDirectory
	^ FileDirectory on: (self environmentDirectory fullNameFor: '_test_magma_backup')