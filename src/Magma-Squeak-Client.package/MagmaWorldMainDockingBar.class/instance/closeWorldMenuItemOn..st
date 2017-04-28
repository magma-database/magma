file menu
closeWorldMenuItemOn: menu 
	menu addItem:
		[ : item | item
			 contents:
				(self worldClass current isInMagma
					ifTrue: [ 'Close down' ]
					ifFalse: [ 'Show IDE Menu' ]) translated ;
			 help:
				(self worldClass current isInMagma
					ifTrue: [ 'Disconnect from the database and close all associated panels.' ]
					ifFalse: [ 'Exit this ' , self worldClass properName , ' menu, back to the IDE menu.  Get back here by selecting Apps | ' , self worldClass properName , '.' ]) translated ;
			 icon: MenuIcons smallQuitIcon form ;
			 target: self worldClass ;
			 selector: #closeCurrent ]