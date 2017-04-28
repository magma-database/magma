*magma server
isOpen
	^ self isRemote 
	or: [ "local" self repositoryController isOpen ]