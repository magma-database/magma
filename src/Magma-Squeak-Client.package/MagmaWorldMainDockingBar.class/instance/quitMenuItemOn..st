file menu
quitMenuItemOn: menu
	menu addItem: [ :item |
		item
			contents: 'Quit' translated;
			help: 'Quit this image' translated;
			icon: MenuIcons smallQuitIcon;
			target: self;
			selector: #quitSqueak ]