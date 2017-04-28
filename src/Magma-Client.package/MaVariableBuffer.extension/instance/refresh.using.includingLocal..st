*magma-client
refresh: variableObject using: aMagmaSession includingLocal: aBoolean
	"Collections require special-case behavior to handle this, dispatch."
	variableObject
		maRefreshTo: self
		using: aMagmaSession