private
updatePrimaryLocation: aMagmaLocalLocation 
	"When a repository is opened locally, if it's location has never been set or was a different *local* location, then update it to the new aMagmaLocalLocation.  If it was formerly a hosted server, do not update since we could be here simply just for re-opening that repository.  So, to go from a remote repository to a local one, you have to manually update the node's primaryLocation."
	| priorLoc |
	priorLoc := self definition node primaryLocation.
	(priorLoc isNil or: 
		[ priorLoc isLocal and: [ priorLoc ~= aMagmaLocalLocation and: [ self restoreMode not ] ] ]) ifTrue: 
		[ self session commit: [ self definition node primaryLocation: aMagmaLocalLocation ] ]