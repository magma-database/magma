accessing
useEllipsisOnTruncate
	"This only applies when shouldWrap is false."
	useEllipsisOnTruncate isNil ifTrue: [ self useEllipsisOnTruncate: true ].
	^ useEllipsisOnTruncate