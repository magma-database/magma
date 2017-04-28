performance
stubOut: anObject 
	"Convert anObject to a proxy, potentially freeing the objects it references for garbage collection.  Useful for keeping memory consumption under control."
	(self canStubOut: anObject) ifFalse: [ ^ self ].
	guard critical:
		[ | obj proxy |
		anObject maIsMutatingProxy
			ifTrue:
				[ "We know the proxy has its real-object reified, because canStubOut: requires that."
				obj := anObject realObjectIfMutatingProxy.
				proxy := anObject.
				proxies remove: anObject ifAbsent: [].
				proxy setRealObjectTo: nil ]
			ifFalse:
				[ obj := anObject.
				proxy := serializer proxyFor: (self oidFor: obj) ].
		transaction remove: obj.
		serializer cleanObject: obj.
		"Not sure this guard is actually necessary but..."
		obj == proxy ifFalse:
			[ obj
				becomeForward: proxy
				copyHash: false ] ]