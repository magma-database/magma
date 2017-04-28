creation
session: aMagmaSession oid: anInteger 
	^ self new
		mutatingProxySession: aMagmaSession ;
		maOid: anInteger

	"no yourself because it causes materialization of the proxy!"