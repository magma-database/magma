*ma base additions
maAsNumber
	"Squeak..  Depending on *how* the receiver is not numeric, It sometimes answers 0, other times signals an error."
	| n |
	^ 
	[ n := self asNumber.
	n = 0 ifFalse: [ n ] ] 
		on: Error
		do: [ : err | err return: nil ]