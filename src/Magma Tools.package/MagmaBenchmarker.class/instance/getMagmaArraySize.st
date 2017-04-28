benchmarks-magmaarrays
getMagmaArraySize

	| array |
	array := fixture at: #magmaArray.
	^ [ array size ] bench