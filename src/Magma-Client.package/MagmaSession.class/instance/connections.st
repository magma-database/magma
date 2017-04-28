connections
connections
	"Answer information about all clients connected to this server.  Calls #connectionsList."
	self ensureIsAdminSession.
	^ self submit: MagmaConnectionsRequest new