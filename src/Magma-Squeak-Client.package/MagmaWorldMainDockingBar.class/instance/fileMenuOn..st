file menu
fileMenuOn: aDockingBar 
	"Same as super, except removes the 'Save as new version' option."
	aDockingBar addItem:
		[ : item | item
			 contents: self worldClass properName translated ;
			 addSubMenu:
				[ : menu | self addFileMenuItemsTo: menu ] ]