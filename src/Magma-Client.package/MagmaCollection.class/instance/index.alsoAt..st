advanced
index: anObject alsoAt: indexableObject 
	"anObject is an object known to be in this collection.  Now use indexableObject to supply its additional index values to point to anObject in my indices.
	Note:  If anObjectis not a member of this collection, but is persistent elsewhere in the repository AND the receiver is persistent, then anObject will NOT be added as a member of the collection even though it would be indexed at values of indexableObject.  That is an abnormal situation the user is responsible to avoid this by using #add:alsoAt:, if necessary."
	(session notNil and: [ session isPersistent: anObject ])
		ifTrue:
			[ indexes do:
				[ : eachIndex | changes
					add: (session oidFor: anObject)
					at: (eachIndex indexHashesFor: indexableObject)
					toIndexForAttribute: eachIndex attribute ] ]
		ifFalse:
			[ self
				add: anObject
				alsoAt: indexableObject ]