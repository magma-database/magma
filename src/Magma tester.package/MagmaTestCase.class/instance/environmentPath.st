initialize-release
environmentPath

	^ (FileDirectory on: super environmentPath) fullNameFor: '_test_magma'