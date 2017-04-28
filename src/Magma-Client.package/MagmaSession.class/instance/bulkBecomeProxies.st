private
bulkBecomeProxies
	| allKnownProxies reified realObjects |
	guard critical:
		[ reified := OrderedCollection new.
		allKnownProxies := proxies.
		self resetProxies.
		allKnownProxies do:
			[ : each | each maIsMutatingProxy ifTrue:
				[ each maRealObjectIsReified
					ifTrue: [ reified add: each ]
					ifFalse: [ self addProxy: each ] ] ].
		realObjects := reified collect:
			[ : each | each realObjectIfMutatingProxy ].
		reified asArray
			elementsForwardIdentityTo: realObjects asArray
			copyHash: false.
		immutabilityStrategy ifNotNil:
			[ realObjects do:
				[ : each | immutabilityStrategy
					rememberImmutableReferencesFrom: each
					for: transaction ] ] ]