accessing
primarySession
	^ self primaryLocation ifNotNil: [ self sessionFor: self primaryLocation ]