testing
isOnlyRemoving
	^ add isNil and: [ self wantsNewPrimary not and: [ remove notNil ] ]