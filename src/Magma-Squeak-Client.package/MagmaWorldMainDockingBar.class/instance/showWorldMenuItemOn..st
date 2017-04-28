file menu
showWorldMenuItemOn: menu
	menu addItem: [ :item |
		item
			contents: 'Show' translated;
			help: 'Open the current ', self worldClass name, ' object on the desktop.' translated;
			icon: MenuIcons smallLeftFlushIcon form ;
			target: self worldClass ;
			selector: #openMauiPanel ]