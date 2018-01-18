methods
selectMethods: aBlock 
	self methods: (self methods select: aBlock)