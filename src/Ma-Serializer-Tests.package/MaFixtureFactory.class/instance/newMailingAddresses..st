creation
newMailingAddresses: anInteger 
	^ (1 to: anInteger) collect: 
		[ : index | 
		MaTestMailingAddress new
			street: (self streetNames at: index) ;
			zip: (self zipCodes at: index) ;
			yourself ]