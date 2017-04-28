testing
respondsTo: aMessage 
	"this is so that respondsTo can be used on proxies without realizing the object needed for explorers which send respondsTo: #explorerContents"
	^ (self class canUnderstand: aMessage) or: [ self realObjectIfMutatingProxy respondsTo: aMessage ]