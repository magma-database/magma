actions
resetOidManager
	"If receiving a byteArray from another serializer, this method should be invoked prior to materializing here so cached oids in the oidManager that may not match the objects that were serialized by the other serializer."
	oidManager reset
