accessing
realObjectIfMutatingProxy
	"The hideous selector is to make sure to avoid any chance of name-space collision with objects that I may need to represent.  I want my client to get the messages, not handle them myself."
	^  realObject ifNil:
		[ | sess theReal | "Reference session in a temp just in case realObjectFor: might cause the thisContexts receiver to be becomed:, at which point 'session' refers to the 1st instVar of the object becomed to."
		sess := session.
		theReal := session realObjectFor: oid.
		self maIsMutatingProxy ifTrue: [ realObject := theReal ].
		sess preferences signalProxyMaterializations ifTrue: [ MagmaProxyMaterialization signalMaterializedObject: realObject ].
		theReal ]