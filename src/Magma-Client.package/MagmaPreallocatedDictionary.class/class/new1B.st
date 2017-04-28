instance creation
new1B
	"Create a Preallocated dictionary with up to 1B slots.  BEWARE:  This will cause up to 7GB of disk-space to be allocated upon commit."
	^ self newAllocation: 1073741789 "Probably prime"