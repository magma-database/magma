private
finalizeOids
	guard critical:
		[ serializer finalizeOids.
		transaction finalizeOids.
		immutabilityStrategy ifNotNil: [ immutabilityStrategy finalizeImmutables ] ]