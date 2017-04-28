test blocks
testExternalRefsBlock2
	"Test a Block that refers to a temporary in its home method."
"	self
		remotePerform: #addExternalRefsBlock2
		in: 'client1'.
	self
		remotePerform: #verifyExternalRefsBlock2
		in: 'client2'"