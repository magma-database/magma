file menu
saveDeployableDatabaseMenuItemOn: aMenu
	aMenu addItem:
		[ : item | item
			 contents: 'Save As Database' translated ;
			 help: 'Saves the current ', self worldClass name, ' as the root object of a Magma database which can be deployed on a server.' translated ;
			 icon: MauiIconSet new emptyDbIcon form ;
			 target: self worldClass ;
			 selector: #saveDeployableDatabase ]