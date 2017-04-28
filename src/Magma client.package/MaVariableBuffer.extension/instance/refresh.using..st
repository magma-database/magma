*magma client
refresh: variableObject using: aMagmaSession
	"Collections require special-case behavior to handle this, dispatch."
	variableObject
		maRefreshTo: self
		using: aMagmaSession