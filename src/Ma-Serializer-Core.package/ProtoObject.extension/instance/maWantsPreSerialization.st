*ma-serializer-core
maWantsPreSerialization
	"Most objects do not need any preserialization behavior, therefore this allows the serializer to avoid the overhead of withAllSuperclassesDo:."
	^ false