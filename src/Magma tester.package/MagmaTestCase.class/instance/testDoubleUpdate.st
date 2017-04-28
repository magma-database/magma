other small tests
testDoubleUpdate
	"Make sure that when an object link is updated more than once before another client refreshes it, that it refreshes correctly."
	self 
		remotePerform: #performDoubleUpdate
		in: 'client1'.
	self 
		remotePerform: #verifyDoubleUpdate
		in: 'client2'