benchmarks-magmaarrays
updateThousandsOfMagmaArrayElements
	| array |
	array := fixture at: #magmaArray.
	session begin.
	^ 
	[ 
	[ 1 
		to: self thousands
		do: 
			[ : x | 
			array 
				at: x
				put: x ].
	session commitAndBegin ] bench ] ensure: [ session abort ]