actions
close
	self current ifNotNil: [ : curr | curr close ].
	self current: nil