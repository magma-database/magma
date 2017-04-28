notifications
noteNumberOfConnections: anInteger 
	"Report the number of known MaClientConnections."
	self statistics numberOfClientConnectionsHistory addValue: anInteger