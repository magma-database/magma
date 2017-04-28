private
current: aMagmaWorld 
	super current: aMagmaWorld.
	MorphicProject current dockingBar:
		(aMagmaWorld
			ifNil: [ TheWorldMainDockingBar new ]
			ifNotNil: [ self menuClass new ])