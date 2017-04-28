*ma-core
maShallowCopy

	| copy |
	copy := self species new: self size.
	self do: [ :each | copy add: each ].
	^copy