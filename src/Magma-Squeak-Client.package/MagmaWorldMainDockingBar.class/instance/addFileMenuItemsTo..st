file menu
addFileMenuItemsTo: aMenu 
	"Same as super, except removes the 'Save as new version' option."
	self newWorldMenuItemOn: aMenu.
	Smalltalk hasMaui ifTrue:
		[ self showWorldMenuItemOn: aMenu.
		self worldClass current isInMagma
			ifFalse: [ self saveDeployableDatabaseMenuItemOn: aMenu ].
		self closeWorldMenuItemOn: aMenu.
		aMenu addLine.
		self configurationMenuItemOn: aMenu ].
	aMenu addLine.
	self
		 saveMenuItemOn: aMenu ;
		 saveAsMenuItemOn: aMenu.
	aMenu addLine.
	self
		 saveAndQuitMenuItemOn: aMenu ;
		 quitMenuItemOn: aMenu