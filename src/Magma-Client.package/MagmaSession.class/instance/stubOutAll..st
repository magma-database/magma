performance
stubOutAll: aCollection 
	"Convert aCollection of objects to proxies, potentially freeing the objects they reference for garbage collection.  Useful for keeping memory consumption under control."
	guard critical:
		[ | obj proxy stubbable objects stubs |
		stubbable := aCollection select:
			[ : each | self canStubOut: each ].
		objects := OrderedCollection new: stubbable size.
		stubs := OrderedCollection new: stubbable size.
		stubbable do:
			[ : each | each maIsMutatingProxy
				ifTrue:
					[ "We know the proxy has its real-object reified, because canStubOut: requires that."
					obj := each realObjectIfMutatingProxy.
					proxy := each.
					proxy setRealObjectTo: nil.
					self addProxy: each ]
				ifFalse:
					[ obj := each.
					proxy := serializer proxyFor: (self oidFor: obj) ].
			objects add: obj.
			stubs add: proxy.
			transaction remove: obj.
			serializer cleanObject: obj ].
		"Not sure this guard is actually necessary but..."
		objects asArray
			elementsForwardIdentityTo: stubs asArray
			copyHash: false ]