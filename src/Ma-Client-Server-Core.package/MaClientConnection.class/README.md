A MaClientConnection is created in the server image when a MaClientSocket connects to a MaServerSocket.  At that point, the client can send request ByteArrays which will be extracted by my extractProcess.  The server allows up to 50 simultaneous connections, after which the oldest is disconnected (but not while they're in a request-lifecycle, of course, since they have to be able to send the response).

Instance Variables
	extractProcess:		<Process> - loops while the client #socket is connected, listening for request ByteArrays, extracting them and processing them when they become available.
	lifecycle:		<Object>
	serverSocket:		<Object>
	shouldContinue:		Set false to allow the extract process and associated socket to clean up normally.
