convert
asDescription
	"This is used so my classes do not have to be part of the client-server protocol."
	^ MagmaIndexDescription 
		attribute: self attribute
		keySize: self keySize
		recordSize: self recordSize