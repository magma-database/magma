private
refreshObject: aMagmaRefreshEvent includingLocal: aBoolean 
	aMagmaRefreshEvent object wantsMagmaEvents ifTrue:
		[ aMagmaRefreshEvent object
			triggerEvent: #magmaAboutToRefresh
			with: aMagmaRefreshEvent
		"calls #aboutToRefreshFromMagma:" ].
	aMagmaRefreshEvent buffer
		refresh: aMagmaRefreshEvent object
		using: self
		includingLocal: aBoolean.
	"We do this here instead of all the time in #markRead:using: because removeKey: is so slow."
	transaction ensureOldHashesCleanedFor: aMagmaRefreshEvent object.
	aMagmaRefreshEvent object realObjectIfMutatingProxy
		postRefreshUsing: aMagmaRefreshEvent buffer
		for: self