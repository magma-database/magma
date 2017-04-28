as yet unclassified
initialize
	builders := WeakIdentityKeyDictionary new.
	WeakArray addWeakDependent: builders.
	self registerForNotifications 