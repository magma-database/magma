accessing
oidCount
	"The number of oids allocated by this repository.  The total number of objects ever committed, even if some have since been garbage-collected."
	^ nextOid - MaOidCalculator firstUserObjectOid