tests
runInsertionOfEndpointKeys
	"This tests keys that fall at the endpoints of records.  It covers the lowest and highest keys."

	self
		verifyInsertionOfDuplicateKey: 0;
		verifyInsertionOfDuplicateKey: (2 raisedTo: index keySize) - 1.
	self verifyIndex