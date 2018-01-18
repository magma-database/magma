access
reset

	currentInnerStream := nil.
	streams reset.
	[ streams atEnd ] whileFalse: [ streams next reset ].
	streams reset