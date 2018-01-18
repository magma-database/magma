accessing
newOrganizationMailingAddresses: anInteger 
	^ (5 to: 5 + anInteger - 1) collect: 
		[ : index | 
		MaTestMailingAddress new
			street: (self streetNames at: index) ;
			zip: (self zipCodes at: index) ;
			yourself ]