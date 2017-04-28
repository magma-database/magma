private
compressedRepositoryDirectory
	^ (FileDirectory on: super environmentPath) fullNameFor: '_test_magma_compressed'