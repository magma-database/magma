serialization
maTransientVariables 
	^ super maTransientVariables, #( 'session' 'cachedObject' )