instance creation
new134M
	"Create a Preallocated dictionary with up to 134M slots.  BEWARE:  This will cause up to 805M of disk space to be allocated upon commit."
	^ self newAllocation: 134217757 "Probably prime"