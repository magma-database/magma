admin
location
	"Answer a new MagmaLocation that can be used later to access to this session without having to be concerned with directory-paths or ip addresses."
	^ primaryLink ifNotNil:
		[ self isLocal
			ifTrue:
				[ (self respondsTo: #repositoryController)
					ifTrue: [ self repositoryController localLocation ]
					ifFalse: [ MagmaEnvironmentError signal: 'The Magma server package should be loaded.' ] ]
			ifFalse: [ MagmaRemoteLocation location: primaryLink location ] ]