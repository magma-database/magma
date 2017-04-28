advanced
add: anObject alsoAt: indexableObject 
	"anObject is known to NOT be committed as a member of this collection.  Ensure anObject is added to the receiver but use indexableObject to supply the index values to point to anObject in my indices.  Like #add:, anObject may only be added once per commit.
	Note:  If both anObject and the receiver are already persistent in the repository, AND anObject is already a member of this collection, it will be added again.  It is the users responsibility to avoid this by using #index:alsoAt:."
	changes
		add: anObject
		alsoAt: (indexes collect: [ : each | each indexHashesFor: indexableObject ])