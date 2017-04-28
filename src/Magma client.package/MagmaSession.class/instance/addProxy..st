private
addProxy: aMagmaMutatingProxy 
	"Add aMagmaMutatingProxy to a list that will be bulk-becomed at an appropriate time."
	guard critical: [ proxies add: aMagmaMutatingProxy ]