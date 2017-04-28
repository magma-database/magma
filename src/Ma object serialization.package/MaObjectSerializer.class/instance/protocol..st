initializing
protocol: aCollection 
	"This is only called once per instance, don't try to reset the protocol because this implementation doesn't remove any old protocol.  Create a new serializer if you have to."
	| sc |
	sc := aCollection asSortedCollection: [ : a : b | a name < b name ].
	sc do: [ : each | classIdManager addNewClass: each ].
	self classIdManager beImmutable