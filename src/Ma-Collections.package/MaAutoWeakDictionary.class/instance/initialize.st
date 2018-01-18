initialize-release
initialize

	super initialize.
	list := WeakFinalizationList new.
	preInitializedAssoc := self associationClass new finList: list.