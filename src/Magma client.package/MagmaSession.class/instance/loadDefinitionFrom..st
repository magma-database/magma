initialize-release
loadDefinitionFrom: aByteArray 
	guard critical: 
		[ definition ifNotNil: 
			[ self
				stubOut: self node ;
				stubOut: self magmaId ;
				stubOut: definition ].
		definition := self materializeObject: aByteArray ]