accessing
signalProxyMaterializations
	"When set to true, every time a proxy is materialized, a MagmaProxyMaterialization notification is signaled.  This is useful during development for performance tuning specifically for optimizing your read strategies."
	^ self attributeNamed: #signalProxyMaterializations