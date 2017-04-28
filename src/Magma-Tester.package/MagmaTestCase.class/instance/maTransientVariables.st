private
maTransientVariables
	"The test-case instance itself now can be potentially serialized due to MethodContext 'receiver's.."
	^ (self class allInstVarNames copyWithoutAll: #('clientSession' 'blockTestFixture'))