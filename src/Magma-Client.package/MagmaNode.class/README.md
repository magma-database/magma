A MagmaNode is a set of running Magma servers supporting one repository, one primary and one or more warm backups.  Typically, these servers would be connected with fast networking, so the backups can have a chance to get into a "synchronized" state, a state where the primary is sending the commitPackages in real-time.

		-- replace MagmaSession>>'link' with this..? --

Goals:  
	- An equivalent MagmaNode is answered by any server in the node, which describes the servers in the node and their current role.
	- The MagmaNode is delivered as part of the session connection process.
	- Normally, MagmaSessions will send all commit requests other than commits to one of the warm-backup links, however..
	- ..MagmaSessions may #submit: any request to any of the links in the node.  Internally, if the request is sent to the "wrong" link:
 		- a commit request sent to a warm backup
		- a read request sent to the primary
	..then Magma will do the following:
		1) the server that received the erroneous request will answer a MaErroneousRequest with a new MagmaNode
		2) the private MagmaSession behavior will pre-interrogate every response with #isErroneousRequest (maybe via normal #on:do: error handling)
		3) The MaErroneousRequest includes a new MagmaNode indicating the new cluster configuration.
		4) the MagmaSession now replaces its 'node' and resubmits the request to the correct server.

	- It is also possible the server went down, the client will get a NetworkError.  When this occurs, the client then asks the first primary to #takeOverAsPrimary.

The MagmaNode is transmitted as a 'domain object' from server to client.  Its 'links' is transient and lazily initialized from its 'locations'.

Magma will ensure it is sent to the correct node (even in case it changed) and adjust their Node if necessary.

Messages sent to link in MagmaSession:
	#submit: aMagmaRepositoryRequest
	#location
	#isConnected
	#protocolEstablished
	#disconnect
	#stat:
	#timeoutSeconds
	#timeoutSeconds:
	#compressThreshold
	#compressThreshold:
	#linkInformation
	#repositoryController
	#isLocal
	#host