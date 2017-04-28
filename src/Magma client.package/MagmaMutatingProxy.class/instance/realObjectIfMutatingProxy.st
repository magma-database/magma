accessing
realObjectIfMutatingProxy
	"The hideous selector is to make sure to avoid any chance of name-space collision with objects that I may need to represent.  I want my client to get the messages, not handle them myself."
	^ realObject ifNil:
		[ realObject := session realObjectFor: oid.
		session addProxy: self.
		session preferences signalProxyMaterializations ifTrue: [ MagmaProxyMaterialization signalMaterializedObject: realObject ].
		realObject ]