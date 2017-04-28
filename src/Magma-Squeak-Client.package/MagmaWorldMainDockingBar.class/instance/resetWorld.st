file menu
resetWorld
	(UIManager confirm: 'Are you sure you want to close this world and start with a new, empty world?') ifTrue: [ self worldClass refresh ]