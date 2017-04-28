overriding
addNewAdditionsTo: aMaCommitPackage using: aMagmaSession

	self additionsDo:
		[ :eachObject :eachHashIndexValues |
		(aMagmaSession isPersistent: eachObject) ifFalse: [ aMaCommitPackage addObject: eachObject ] ]