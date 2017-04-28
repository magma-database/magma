initialize-release
initialize
	super initialize.
	self initializeWriters.
	position := 0.
	guard := Mutex new.
	"To make code simple, everyone gets a default pool, which is just a pool of one, me."
	pool := MaFileStreamPool maxSize: 1.
	fileStreams := OrderedCollection new.
	sizes := OrderedCollection new