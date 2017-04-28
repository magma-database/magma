*magma-client
refresh: anObject using: aMagmaSession includingLocal: aBoolean 
	"WeakKeyDictionaries can have nil keys."
	anObject ifNil: [ ^ self ].
	anObject realObjectIfMutatingProxy
		refreshFrom: self
		using: aMagmaSession
		includingLocal: aBoolean