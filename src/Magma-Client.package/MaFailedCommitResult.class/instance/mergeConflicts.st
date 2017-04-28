actions
mergeConflicts
	"Let all conflicts merge from their conflictors.  After doing this, answer a collection of Associations of objects still in conflict.  The keys are the now-committed versions of the objects, the values are MY sessions versions of these objects."
	^self conflictingObjects reject:
		[ : eachAssoc | | eachChanged eachMine classDefs |
		eachChanged := eachAssoc key.
		eachMine := eachAssoc value.
		classDefs := eachChanged magmaSession definition classDefinitions.
		eachChanged == classDefs or: [ (classDefs includesIdentity: eachChanged) or: [ eachChanged mergeConflicting: eachMine ] ] ]