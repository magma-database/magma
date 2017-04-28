private
ensureNoOidReuse
	"We can never allow an oid to be reused.  Once an object is created and persisted, its oid must be forever consumed.  Even if that object is later dereferenced, its oid will never be reused.  This is necessary to properly support universal-identity which is essential for MagmaForwardingProxys."
	"determine the next oid to be used in our inputController."
	| nextOid |
	nextOid := inputController repository filer getNextOid.
	"Force our output controller to allocate up to the current oid."
	outputFiler getNextOid < nextOid ifTrue: 
		[ outputFiler 
			index: nextOid - 1
			at: 0 ]