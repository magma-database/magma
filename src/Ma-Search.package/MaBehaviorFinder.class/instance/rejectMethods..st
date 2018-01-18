methods
rejectMethods: aBlock 
	self methods: (self methods reject: aBlock)