*magma-server
process
	"Just like selecting it from the World menu.  shutdown process has responsibility to do it cleanly."
	repositoryController 
		serverSave: save
		andExit: exit.
	^ true