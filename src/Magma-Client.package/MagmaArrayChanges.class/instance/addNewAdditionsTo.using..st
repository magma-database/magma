overriding
addNewAdditionsTo: aMaCommitPackage using: aMagmaSession

	self additionsDo:
		[ : eachIndex : eachObject |
		(aMagmaSession isPersistent: eachObject) ifFalse: [ aMaCommitPackage addObject: eachObject ] ]