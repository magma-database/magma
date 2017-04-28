special collections
weakValueDictionaryClass
	^ WeakValueDictionaryClass
		ifNil: [ self defaultWeakValueDictionaryClass ]
		ifNotNil:
			[ WeakValueDictionaryClass isAutoCleaning
				ifTrue: [ self defaultWeakValueDictionaryClass ]
				ifFalse: [ WeakValueDictionaryClass ] ]