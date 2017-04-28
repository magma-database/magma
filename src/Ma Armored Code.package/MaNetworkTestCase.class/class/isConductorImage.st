other squeak images
isConductorImage
	^ (FileDirectory default localNameFor: SmalltalkImage current imageName) 
		maBeginsWith: self conductorImageFilename
		caseSensitive: true