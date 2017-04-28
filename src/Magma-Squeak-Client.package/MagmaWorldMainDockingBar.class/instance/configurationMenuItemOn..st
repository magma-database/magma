file menu
configurationMenuItemOn: menu 
	menu addItem:
		[ : item | item
			 contents: 'Configure' translated ;
			 help: 'Opens a new ', self worldClass installerClass name, ' panel.' translated ;
			 icon: MauiIconSet new tinyWrench form ;
			 target: self worldClass ;
			 selector: #openConfigurationPanel ]