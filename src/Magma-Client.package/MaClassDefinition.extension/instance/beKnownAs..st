*magma-client
beKnownAs: newClassName
	self className ifNotNil: [ aliases add: self className ].
	self className: newClassName