test Set
testSet
	"Set and Dictionary are special because their instances are serialized in their logical form.  For Dictionary, a MaVariableObjectBuffer with oids paired for key, value, key, value,... etc."
	self
		remotePerform: #createTestSet
		in: 'client1'.
	self
		remotePerform: #verifyTestSet
		in: 'client2'.