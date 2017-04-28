connections
isConnected
	"Answer whether I am *logically* connected to my repository.  This is independent of whether I have a physical socket connection.  Magma makes this irrelevant, since physical socket disconnections can occur based on timeouts, the reconnection to the Magma are reestablished automatically, as needed."

"The above comment is wrong.  We nil out the id in primDisconnect. Perhaps we should be checking the 'definition' instead?"

	^id notNil