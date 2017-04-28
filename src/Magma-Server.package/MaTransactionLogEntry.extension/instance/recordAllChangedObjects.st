*magma-server
recordAllChangedObjects
	"Record all of the objects that the client will need to refresh."

	challengingEntries do: [ :each | result addToBeRefreshed: each committed ]
