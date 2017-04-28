*magma server
process
	"Any persistent objects returned by this should be materialized only by the sessions
	serializer, not the repositoryLink's serializer because the sessions serializer is what
	works with the transaction to mark it read so changes can be detected."

	self subclassResponsibility
