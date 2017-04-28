file menu
saveAsMenuItemOn: menu

	menu addItem: [ :item |	
		item
			contents: 'Save As...' translated;
			help: 'Save the current state of desktop on disk under a new name' translated;
			icon: MenuIcons smallSaveAsIcon;
			target: self;
			selector: #saveImageAs ]