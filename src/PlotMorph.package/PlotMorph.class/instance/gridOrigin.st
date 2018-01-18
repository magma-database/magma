private
gridOrigin
	"Answer the intersection of the two axes (lower left corner of the grid)"
	| inset |

	inset := self borderWidth + margin.
	^ self bottomLeft + (inset @ inset negated)