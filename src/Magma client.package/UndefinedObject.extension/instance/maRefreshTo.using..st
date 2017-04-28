*magma client
maRefreshTo: aMaStorageObjectBuffer using: aMagmaSession
	"Because nil keys develop in WeakKeyDictionaries, this method is necessary."
	^ self