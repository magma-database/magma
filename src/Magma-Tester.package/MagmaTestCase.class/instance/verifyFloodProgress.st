test forward recovery
verifyFloodProgress
	"Get entirely new MagmaSession client instances, to be sure we aren't reading cached data."
	self
		 stopFloodProcesses ;
		 verifyFloodProgress: self class magmaServerLocation