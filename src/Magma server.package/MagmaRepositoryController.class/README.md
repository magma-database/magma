A MagmaRepositoryController is the main user interface to a Magma repository.  With this class you create, open and delete repositories.  

Instance Variables
	localLocation:  a MagmaLocalLocation specifying where the repository is opened on.
	preferences:  A MagmaServerPreferences specifying various server-level options.
	repository:  The center of the Magma server universe, manages server operations.  Private from general public use.
	requestInterruptGuard:  Monitor to allow only one request at a time to execute.
	serverSerializer:  The serializer used to send certain whole graph-buffers back to the client.  (My sessions serializer cannot be used because it is optimized for a MagmaSession; i.e., only serializing each object one level deep, etc.).
	session:  My standard session used to perform standard operations on the model, mostly for LargeCollection support.
