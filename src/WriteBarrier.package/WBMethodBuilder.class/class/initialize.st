as yet unclassified
initialize
	Cache ifNotNil: [ WeakArray removeWeakDependent: Cache ].
	Cache := WeakIdentityKeyDictionary new.
	WeakArray addWeakDependent: Cache