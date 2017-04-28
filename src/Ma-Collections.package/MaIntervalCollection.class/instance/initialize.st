private
initialize
	super initialize.
	intervals := SortedCollection sortBlock: [ : a : b | a first < b first ].
	proximityThreshold := 1