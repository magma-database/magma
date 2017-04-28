private
setUpSuite
	"Subclasses may implement general set-up code for that should only run once for all tests.  For example,network tests maintain a connection to other machinesthat participate in the test.  The facades to these other machines needs to be maintained."
	^ self class setUpSuite