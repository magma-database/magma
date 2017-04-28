private
update: addedOrRemovedSymbol
	"My collection has had an object added or removed, I will now need to remerge its uncommitted contents into my segment."
	self initializeSegments