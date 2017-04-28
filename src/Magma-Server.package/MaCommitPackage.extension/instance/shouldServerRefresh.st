*magma-server
shouldServerRefresh
	"Anytime a largeCollection domain object changes, the server should
	refresh so we process all of the new large collections or their new
	indexes."

	^ allLargeCollectionChanges notNil
	and: [ allLargeCollectionChanges anySatisfy: [ :each | each requiresServerRefresh ] ]