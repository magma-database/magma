*magma-server
addToBeRefreshed: aDictionary 
	"aDictionary the containing the MaObjectBuffers that were committed by other sessions, keyed by their oid."
	"We use addAll: so that oids are replaced by subsequent updates."
	toBeRefreshed addAll: aDictionary