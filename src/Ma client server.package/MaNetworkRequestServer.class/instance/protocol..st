private
protocol: aCollection
	"Establish the class ids of classes in the protocol."
	aCollection do: [ : each | serializer classIdManager addNewClass: each ].
	"Protocol established, now disallow any further new classes!"
	serializer classIdManager beImmutable 