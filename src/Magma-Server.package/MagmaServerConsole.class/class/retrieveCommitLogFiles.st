private
retrieveCommitLogFiles
	"Script which (employs Banyan to?) copy files from one (remote? ssh?) directory to another.  A roll-forward script could then be used to simply #open: the Repository (which will invoke an automatic roll-foward) and then immediately #close (without ever processing on a port, so no attempt to hook up an HA connection)."