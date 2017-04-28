handler
handleAndResumeUsing: aMagmaSession 
	self resume: (aMagmaSession ifNotNil: [ doBlock value: aMagmaSession ])