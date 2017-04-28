private
scanFor: anObject 
	"Answer the Association keyed by anObject or nil"
	^ self equivalentOf: (MagmaDictionaryAssociation key: anObject)