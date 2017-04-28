test class schema upgrades
testClassSchemaUpgrades
	"This method tests Magma's ability to run with a class-definition out-of-sync with the repository, as well as performing a live upgrade of MagmaPerson.

	- First, we commit initial MagmaPerson instances right here in the conductor image.
	- client1 adds an 'contactMethods' attribute in the image only as the first instVar of the superclass (MagmaContact).
	- client2 connects to the db, reads the MagmaPerson (without any contactMethods).
	- client1 sets the contactMethods, commits the latest code and the MagmaPerson.
	- client2 changes the name and commits, should get a commit-conflict, which causes the object to be refreshed (now known to be truncated).
	- client2 changes the name again and commits, should get a warning that data will be lost.  client2 aborts the commit.
	- client2 loads the latest code, since any commits are going to lose the address.
	- client2 stubsOut: the MagmaPerson to force a refresh of that object and clear the truncation flag.
	- client2 tries to change the name for a third time.  This time it should work.
	- client2 verifies the address added by client1.
	- client1 verifies the name change.
	- delete domain classes off the server, shutdown and reopen and ensure they don't get recompiled."
	self class allowWriteBarrier ifFalse: 
		[ self
			commitInitialMagmaPerson ;
			remotePerform: #addContactMethodsAttribute
				in: 'client1' ;
			remotePerform: #readPerson
				in: 'client2' ;
			remotePerform: #setContactMethodsAndCode
				in: 'client1' ;
			remotePerform: #changeName
				in: 'client2' ;
			remotePerform: #verifyNameChange
				in: 'client1' ]