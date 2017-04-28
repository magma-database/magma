*magma-client
mergeConflicting: anAssociation 
	^ self key realObjectIfMutatingProxy = anAssociation key realObjectIfMutatingProxy and: [ self value realObjectIfMutatingProxy = anAssociation value realObjectIfMutatingProxy ]