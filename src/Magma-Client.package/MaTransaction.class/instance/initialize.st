initializing
initialize
	super initialize.
	readSet := MaObjectSerializerPreferences newWeakIdentityKeyDictionary.
	largeCollectionChanges := WeakSet new.
	self resetCommitPackage.
	ignoreModifiedSignals := false.
	"Conveniently initialized to avoid nil check in code."
	commitNumber := 0.
	dictionaryArrays := MaObjectSerializerPreferences newWeakIdentityKeyDictionary