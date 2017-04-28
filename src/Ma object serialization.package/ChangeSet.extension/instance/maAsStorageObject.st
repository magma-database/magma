*ma object serialization
maAsStorageObject
	"While we can store ChangeSets and their CompiledMethods directly, a logical representation (i.e., my fileOut) is probably better.  Therefore, we file out me to a stream and keep that along with my name.  My code will NOT be automatically filed-in on materialization."

	| stream |
	stream := ReadWriteStream on: String new.
	self fileOutOn: stream.
	stream position: 0.
	^ self name -> stream