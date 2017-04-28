MagmaClientConnection is used primarily by the server as an object that represents a single MagmaSession connected to it.

But this object is also used by clients in cases where information about other connected clients is useful.  For example, when a commit-conflict occurs, MagmaCommitConflict is passed back to the client with information about the MagmaClientConnection(s) he's conflicting with.

Instance Variables

challengingBytes
	- xxxxx

currentReadStrategy
	- xxxxx

isSystem
	- xxxxx

maClientConnection
	- xxxxx

maximumNumberOfChallengers
	- xxxxx

sessionId
	- xxxxx

userId
	- xxxxx
