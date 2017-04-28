private
installCopyingOverrides
	class
		compileSilently: 
'shallowCopy
	| copy |
	copy := super shallowCopy.
	copy == self ifFalse:
		[copy primitiveChangeClassTo: (copy class superclass basicNew)].
	^ copy'
		classified: 'overrides'.
	class
		compileSilently: 
'clone
	| copy |
	copy := super clone.
	copy == self ifFalse:
		[copy primitiveChangeClassTo: (copy class superclass basicNew)].
	^ copy'
		classified: 'overrides'