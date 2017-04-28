*magma-client
postRefreshUsing: aMaObjectBuffer for: aMagmaSession 
	self rehash.
	^ super
		postRefreshUsing: aMaObjectBuffer
		for: aMagmaSession