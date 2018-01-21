private
initializeFrom: aClass

	self globalName: aClass name.
	instVarNames := aClass allInstVarNames.
	classVarNames := aClass classVarNames.
	poolDictionaryNames := aClass sharedPoolNames.
	classInstVarNames := aClass class instVarNames.
	category := aClass category.
	type := aClass typeOfClass.
	comment := aClass organization classComment asString.
	commentStamp := aClass organization commentStamp