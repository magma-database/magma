private
ensureProxy: aMagmaMutatingProxy
	(proxies includes: aMagmaMutatingProxy) ifFalse: [ proxies add: aMagmaMutatingProxy ]