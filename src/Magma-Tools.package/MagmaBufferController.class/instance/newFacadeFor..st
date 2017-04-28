private
newFacadeFor: oidInteger 
	^ MagmaBufferFacade
		buffer: (session bufferForOid: oidInteger)
		controller: self