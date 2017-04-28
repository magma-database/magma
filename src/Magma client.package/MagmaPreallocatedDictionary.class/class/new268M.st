instance creation
new268M
	"Create a Preallocated dictionary with up to 268M slots.  BEWARE:  This will cause up to  1.61G of disk space to be allocated upon commit."
	^ self newAllocation: 268435399 "Probably prime"