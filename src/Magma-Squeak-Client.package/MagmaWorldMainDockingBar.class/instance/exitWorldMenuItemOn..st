app menu
exitWorldMenuItemOn: aDockingBarMenuMorph 
	aDockingBarMenuMorph
		 addLine ;
		 addItem:
			[ : item | item
				 contents: 'IDE' translated ;
				 help: 'Remove the application menu -- for further development.' translated ;
				 target: self worldClass ;
				 selector: #reset ]