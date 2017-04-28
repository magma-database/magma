test grow an object
testGrowObject
	"Magma has special-case code on the server (see MaObjectFiler>>#write:index:) that checks whether an object now takes up more space than it used to.  This can occur when a variable is added to a class, or when a Collection had to grow its internal Array.  This test exercises that code."

	self
		remotePerform: #addAndGrowObject
		in: 'client1'.
	self
		remotePerform: #readAndVerifyGrownObject
		in: 'client2'