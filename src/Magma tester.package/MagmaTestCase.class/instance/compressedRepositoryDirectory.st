test compress
compressedRepositoryDirectory
	^ FileDirectory on: ((FileDirectory on: super environmentPath) fullNameFor: '_test_magma_compressed')