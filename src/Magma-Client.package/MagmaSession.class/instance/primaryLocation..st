private
primaryLocation: aMagmaRemoteLocation 
	"Set my primary (commit) location to the repository aMagmaRemoteLocation."
	primaryLink location ~= aMagmaRemoteLocation serverLocation ifTrue:
		[ | oldLink |
		oldLink := primaryLink.
		primaryLink disconnect.
		primaryLink := aMagmaRemoteLocation newServerLink
			 preferences: primaryLink preferences copy ;
			 yourself.
		(MagmaLinkChange
			oldLink: oldLink
			newLink: primaryLink) signal ]