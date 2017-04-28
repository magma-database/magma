test backup/restore
requiredPrereqsToVerifyRestore
	"Answer the tests which must have completed before verifyRestore can be run."
	^ #(
		#verifyCollectionAndReader
		#verifyAddedCollectionAndIndex
		#verifyPersistentResultSet
	) asSet