private
secondaryLocation: aMagmaRemoteLocation 
	"Set my secondary (read) location to the repository aMagmaRemoteLocation."
	secondaryLink location ~= aMagmaRemoteLocation serverLocation ifTrue: 
		[ secondaryLink disconnect.
		secondaryLink := primaryLink location = aMagmaRemoteLocation serverLocation 
			ifTrue: [ primaryLink ]
			ifFalse: 
				[ aMagmaRemoteLocation newServerLink
					preferences: secondaryLink preferences copy ;
					yourself ] ]