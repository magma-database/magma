accessing
sortAttribute
	"My clauses are reduced to just the ones that must be enumerated to find the result.  If that reduction was down to one then the order will be per that indexed attribute."
	^ clauses size = 1 ifTrue: [ clauses first attribute ]