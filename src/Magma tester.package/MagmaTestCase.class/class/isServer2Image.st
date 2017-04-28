testing
isServer2Image
	^ (self hasPlayerLinkNamed: 'server2') and: 
		[ (FileDirectory localNameFor: SmalltalkImage current imageName) = (self server2ImageFilename , '.image') ]