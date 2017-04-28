*ma object serialization
maAsStorageObject
	"I am about to be written on an object file.  If I am one of two shared global arrays, write a proxy instead."

	"Note this behavior copied from Array>>#objectForDataStream:."
	self == (TextConstants at: #DefaultTabsArray)
		ifTrue: [ ^ DiskProxy global: #TextConstants selector: #at: args: #(DefaultTabsArray) ].
	self == (TextConstants at: #DefaultMarginTabsArray)
		ifTrue: [ ^ DiskProxy global: #TextConstants selector: #at: args: #(DefaultMarginTabsArray) ].
	^ super maAsStorageObject