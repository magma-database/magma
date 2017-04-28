framework
startPlayer
	super startPlayer.
	(self thisPlayer name beginsWith: 'client') ifTrue: [ self removeServerPackage ]