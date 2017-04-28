test changed detection
testChangedDetection
	"There is a special case when using the WriteBarrier for which it requires special handling by Magma for it to detect change to the object.  See #valueWhileObservingStateChange for details."
	self
		
		remotePerform: #setupChangedDetection
		in: 'client1' ;
		
		remotePerform: #slyUpdate
		in: 'client2' ;
		
		remotePerform: #verifySlyUpdate
		in: 'client1'