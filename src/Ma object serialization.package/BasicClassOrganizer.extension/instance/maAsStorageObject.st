*ma object serialization
maAsStorageObject 

	^ self maUsesStandardStorage
		ifTrue: [ super maAsStorageObject ]
		ifFalse: [ DiskProxy global: self subject name selector: #organization args: #() ]