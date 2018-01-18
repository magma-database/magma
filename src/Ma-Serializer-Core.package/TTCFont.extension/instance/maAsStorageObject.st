*ma-serializer-core
maAsStorageObject
	"I am about to be written on an object file.  Write a
reference to a known FontSet in the other system instead."
	"a path to me"
	^ DiskProxy 
		global: #TTCFont
		selector: #familyName:pointSize:emphasis:
		args: { 
				(self familyName).
				(self pointSize).
				(self emphasis)
			 }