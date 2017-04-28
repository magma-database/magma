file menu
newWorldMenuItemOn: menu 
	menu addItem:
		[ : item | item
			 contents: ('New ', self worldClass name) translated ;
			 help: 'Close the current ', self worldClass name, ' and create a new one.' translated ;
			 icon: MenuIcons smallNewIcon form ;
			 target: self ;
			 selector: #resetWorld ]