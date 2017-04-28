initialize-release
loadClassDefinitionsFrom: aByteArray 
	guard critical: [ serializer classDefinitions: (self materializeObject: aByteArray) ]