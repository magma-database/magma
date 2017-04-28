construction
menusOn: aDockingBarMorph 
	| appMenu |
	appMenu := self
		 fileMenuOn: aDockingBarMorph ";
		 applicationMenuOn: aDockingBarMorph.
	self
		 exitWorldMenuItemOn: appMenu ;
		 helpMenuOn: aDockingBarMorph"