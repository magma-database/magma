copying
copy
	| dict |
	dict := self species new: self size.
	self associationsDo: [:b | dict at: b key put: b value  ].
	^ dict.