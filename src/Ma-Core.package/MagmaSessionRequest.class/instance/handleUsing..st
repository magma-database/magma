handler
handleUsing: aMagmaSession 
	aMagmaSession ifNotNil: [ doBlock value: aMagmaSession ]