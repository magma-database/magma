*magma-server
nodeCheck
	"This request is used to catch-up clients which have been disconnected.  If, while disconnected, the Node configuration changed, they will have an outdated view of the node until they can get reconnected and caught up.
	Therefore, allow this request to be issued by the primary servers.
	This fixes the stack-overflow issue which could occur under that circumstance."