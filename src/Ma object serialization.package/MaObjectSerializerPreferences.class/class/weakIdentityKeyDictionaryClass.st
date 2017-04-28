special collections
weakIdentityKeyDictionaryClass
	^ WeakIdentityKeyDictionaryClass
		ifNil: [ self defaultWeakIdentityKeyDictionaryClass ]
		ifNotNil:
			[ WeakIdentityKeyDictionaryClass isAutoCleaning
				ifTrue: [ self defaultWeakIdentityKeyDictionaryClass ]
				ifFalse: [ WeakIdentityKeyDictionaryClass ] ]