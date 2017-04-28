private
intervalsIntersecting: anInterval

	^ intervals select: [ : each | each maIntersects: anInterval ]