system-initialization
initialize
	Transcript cr; show: 'Declaring SigTermHandler'.
	Smalltalk
		addToStartUpList: self ;
		at: #SigTermHandler ifAbsentPut: [ nil ] ;
		restartSigTermHandler