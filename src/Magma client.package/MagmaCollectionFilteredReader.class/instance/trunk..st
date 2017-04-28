private
trunk: aMaQueryTrunk 
	super trunk: aMaQueryTrunk.
	segments do: [ : each | each trunk: aMaQueryTrunk ]