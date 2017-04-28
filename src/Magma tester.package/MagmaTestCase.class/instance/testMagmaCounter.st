test MagmaCounter
testMagmaCounter
	"- make sure no commit-conflict.
- verify value"
	self
		remotePerform: #createCounter
			in: 'client1' ;
		remotePerform: #validateAndIncrementCounter
			in: 'client2' ;
		remotePerform: #validateAndDecrementCounter
			in: 'client1' ;
		remotePerform: #finalValidateCounter
			in: 'client2'