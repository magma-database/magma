private
fpRemoteOid
	"Answers the oid of the repository which my realObject belongs."
	"The only time my oid should be nil is if a non-persistent object is sent #asMagmaForwardingProxy."
	^ oid