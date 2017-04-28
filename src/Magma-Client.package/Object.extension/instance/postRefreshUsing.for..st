*magma-client
postRefreshUsing: aMaObjectBuffer for: aMagmaSession
	aMagmaSession transaction
		markRead: self
		using: aMaObjectBuffer