instance creation
new67M
	"Create a Preallocated dictionary with up to 67M slots.  BEWARE:  This will cause up to  402.65M of disk space to be allocated upon commit."
	^ self newAllocation: 67108879 "67M, prime"