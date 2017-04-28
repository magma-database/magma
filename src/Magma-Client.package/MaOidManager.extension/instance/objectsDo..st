*magma-client
objectsDo: oneArgBlock 
	oids keysDo:
		[ : each | (each maIsMutatingProxy not or: [ each maRealObjectIsReified ]) ifTrue: [ oneArgBlock value: each ] ]