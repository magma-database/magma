file menu
saveMenuItemOn: menu

	menu addItem: [ :item |
		item
			contents: 'Save' translated;
			help: 'Save the current state of the desktop on disk' translated;
			icon: MenuIcons smallSaveIcon;
			target: self;
			selector: #saveImage ]