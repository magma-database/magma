*ma-core
hash
	"Squeak's hash for nil since 2009.  Allow this literal to have its own value hash independent of its identityHash, to be safer with distributed systems which may be using nil in a hash calculation."
	^ 1006632960