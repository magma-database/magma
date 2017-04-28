initialize-release
close
	super close.
	oidIndexes do: [ : each | each close ].
	keyIndexes do: [ : each | each close ]