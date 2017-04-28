private
bulkBecomeProxies
	| unstubbedProxies realObjects |
	guard critical:
		[ unstubbedProxies := Array streamContents:
			[ : stream | proxies do:
				[ : each | (each maIsMutatingProxy and: [ each maRealObjectIsReified ]) ifTrue: [ stream nextPut: each ] ] ].
		realObjects := unstubbedProxies collect:
			[ : each | each realObjectIfMutatingProxy ].
		unstubbedProxies
			elementsForwardIdentityTo: realObjects
			copyHash: false.
		self initializeProxies ]