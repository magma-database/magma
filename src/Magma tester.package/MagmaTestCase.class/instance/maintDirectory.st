test backup/restore
maintDirectory
	^ FileDirectory on: (self environmentDirectory fullNameFor: '_test_magma_maint')