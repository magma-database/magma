private
refreshObject: aMagmaRefreshEvent

	aMagmaRefreshEvent object wantsMagmaEvents
		ifTrue:
			[ aMagmaRefreshEvent object
				triggerEvent: #magmaAboutToRefresh "calls #aboutToRefreshFromMagma:"
				with: aMagmaRefreshEvent ].
	aMagmaRefreshEvent buffer
		refresh: aMagmaRefreshEvent object
		using: self.
	transaction
		"We do this here instead of all the time in #markRead:using: because removeKey: is so slow."
		ensureOldHashesCleanedFor: aMagmaRefreshEvent object ;
		
		markRead: aMagmaRefreshEvent object
		using: aMagmaRefreshEvent buffer