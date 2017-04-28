testing
isServerImage
	^ (self hasPlayerLinkNamed: 'server') and: 
		[ (FileDirectory localNameFor: SmalltalkImage current imageName) = (self serverImageFilename , '.image') ]