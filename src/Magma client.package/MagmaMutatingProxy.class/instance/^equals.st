testing
= object 
	"The only way to answer correctly is for the fully-materialized objects to tell you.  However, if object is the same object as me, it would be true.  Getting two separate mutating-proxies for the same object is possible when a storage-object refers to a persistent object (i.e., MaCompiledMethodStorage>>'className')."
	self == object ifTrue: [ ^ true ].
	^ object maIsMutatingProxy
		ifTrue:
			[ (self maRealObjectIsReified and: [ object maRealObjectIsReified ])
				ifTrue: [ self realObjectIfMutatingProxy = object realObjectIfMutatingProxy ]
				ifFalse:
					[ (self mutatingProxySession magmaId = object mutatingProxySession magmaId and: [ self maOid = object maOid ]) or: [ self realObjectIfMutatingProxy = object ] ] ]
		ifFalse: [ self realObjectIfMutatingProxy = object ]