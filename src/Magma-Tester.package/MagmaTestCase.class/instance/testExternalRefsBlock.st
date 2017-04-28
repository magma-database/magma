test blocks
testExternalRefsBlock
	"Test a Block that refers to a temporary in its home method."
"	self
		remotePerform: #addExternalRefsBlock
		in: 'client1'.
	self
		remotePerform: #verifyExternalRefsBlock
		in: 'client2'"