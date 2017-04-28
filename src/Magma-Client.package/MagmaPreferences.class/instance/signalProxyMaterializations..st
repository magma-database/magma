accessing
signalProxyMaterializations: aBoolean 
	"Whether a MagmaProxyMaterialization should be signaled whenever a proxy is converted to a real object."
	self
		attributeNamed: #signalProxyMaterializations
		put: aBoolean