private
intervalsInside: anInterval

	^ intervals select: [ : each | anInterval maEnvelopes: each ]