private
refreshClassDefinitions
	"This for a very specific scenario.  If the user attempts to commit a new or changed class and the commit fails for any reason, their classMaps (both persistent and non-persistent) need to be restored to their state without all the new classes because, if they then try to commit some of those same new classes again, it will not detect the new addition to the classDefinitions."
	guard critical: 
		[ transaction suspendWriteBarrierModifiedsWhile: 
			[ self refresh: serializer classDefinitionsById.
			serializer classDefinitionsById do: [ : eachDefinitions | self refresh: eachDefinitions ].
			serializer classIdManager rebuildTransientClassMaps ] ]