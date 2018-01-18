initialize-release
initialize: sz

	super initialize: sz.
	list := WeakFinalizationList new.
	preInitializedAssoc := self associationClass new finList: list.