accessing
protocol
	"Calculate and answer the protocol based on assigned classId's (which, because superclasses are added, may not match the original protocol set).  This is used for fileingout a single object, the user is not burdened with protocol, it is calculated and stored with the object."
	^ ((self classDefinitionsById select: [ : each | each anyOne id > self initialClassId ]) asSortedCollection: [ : a : b | a anyOne id < b anyOne id ]) collect: [ : each | each anyOne classObject ]