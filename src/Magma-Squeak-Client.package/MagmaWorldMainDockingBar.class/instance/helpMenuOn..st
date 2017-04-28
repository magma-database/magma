help menu
helpMenuOn: aDockingBarMenuMorph 
	aDockingBarMenuMorph addItem:
		[ : item | item
			 contents: 'Help' translated ;
			 addSubMenu: [ : menu |  self helpSubmenuOn: menu ] ]