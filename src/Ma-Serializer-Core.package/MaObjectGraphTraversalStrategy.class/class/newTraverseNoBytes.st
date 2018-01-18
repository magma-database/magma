create
newTraverseNoBytes
	"Make a new traversal strategy that does not traverse into individual bytes or words of those class-types, only named and index pointers."
	^ self new traverseWhen:
		[ : path : parent : index | | obj cl |
		obj := path last.
		cl := self class.
		cl = CompiledMethod ifTrue: [ ^ true ].
		cl isBytes ifTrue: [ ^ false ].
		cl isPointers ifFalse: [ ^ false ].
		^ true ]