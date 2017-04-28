private
initialize
	super initialize.
	valueWhenBlock := [:path :parent :instVarIndex | true].
	traverseWhenBlock := [:path :parent :instVarIndex | true]