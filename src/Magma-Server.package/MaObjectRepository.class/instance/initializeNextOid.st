actions
initializeNextOid
	"Initialize it to the current-highest oid, because we always incrmement it when getting it."
	nextOid := filer getNextOid - 1