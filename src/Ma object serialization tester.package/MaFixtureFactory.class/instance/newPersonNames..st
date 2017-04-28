creation
newPersonNames: anInteger 
	^ (1 to: anInteger) collect: 
		[ : index | 
		MaTestPersonName new
			first: (self firstNames at: index) ;
			middle: (self middleNames at: index) ;
			last: (self lastNames at: index) ;
			yourself ]