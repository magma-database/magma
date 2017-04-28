file menu
saveAndQuitMenuItemOn: menu

	menu addItem: [ :item |
		item
			contents: 'Save And Quit' translated;
			help: 'Save the current state of the desktop on disk, then quit.' translated;
			icon: MenuIcons smallQuitIcon;
			target: self;
			selector: #saveAndQuitSqueak ]