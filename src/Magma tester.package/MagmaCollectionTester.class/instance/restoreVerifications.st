test backup/restore
restoreVerifications
	"Answer the selectors of the verification methods we will use to ensure the restored backup looks equivalent to the original."
	^ self requiredPrereqsToVerifyRestore , #(
			#verifySamples
			#verifyTestSet
			#verifyDoubleUpdate
			#verifyMagmaCollectionAndIndexCreatedSimultaneously
			#verifyUpdateByteObjects
			#readAndVerifyGrownObject
			#verifyReferenceToSession
		)