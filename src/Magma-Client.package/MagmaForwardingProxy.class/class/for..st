create
for: anObject 
	"Create a new forwarding-proxy for anObject.  Any messages sent to the proxy will be forwarded on to anObject and the answer returned.  This way, models may continue to run with or without a repository, but with the same Magma-aware code-base."
	^ self new
		cachedObject: anObject realObject ";
		yourself"  "do not include yourself this time, it forwards it to anObject!"