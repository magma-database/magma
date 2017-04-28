test MagmaDictionary
verifyMagmaDictAfterUpdates: aMagmaDictionary 
	"Make sure still the correct size."
	self assert: aMagmaDictionary lastKnownSize = 303.
	"verify access before and after page-switch."
	self
		 assert: (aMagmaDictionary at: 450 asWords) = 450 asWords asUppercase ;
		 assert: (aMagmaDictionary at: 350 asWords hash) = 'other 350' ;
		 assert: (aMagmaDictionary at: 350 asWords) = 350 ;
		 assert: (aMagmaDictionary at: 650 asWords) = 650 ;
		 assert: (aMagmaDictionary at: 250 asWords) = 250 ;
		 assert: (aMagmaDictionary at: 650 asWords) = 650 ;
		 assert: (aMagmaDictionary at: 450 asWords) = 450 asWords asUppercase ;
		 assert: (aMagmaDictionary at: 350 asWords) = 350 ;
		 assert: (aMagmaDictionary at: 350 asWords hash) = 'other 350'.
	self
		 assert: aMagmaDictionary lastKnownSize = 303 ;
		 assert: aMagmaDictionary size = 303