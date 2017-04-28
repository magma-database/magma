accessing
requiredProgress
	"When using Magma in a multi-server configuration, it may be possible to occasionally find the secondary read-servers 'behind' the primary server.  Applications that cannot tolerate behind reads may specify the minimum requiredProgress for future reads."
	^ requiredProgress