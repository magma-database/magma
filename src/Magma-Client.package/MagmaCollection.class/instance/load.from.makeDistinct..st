private
load: aMagmaCollection from: aMagmaCollectionReader makeDistinct: aBoolean 
	"reset aMagmaCollection changes only to set isNewCollection false, because that really means 'is local collection', and we need it to go to the server for its contents.."
	session 
		load: aMagmaCollection
		from: aMagmaCollectionReader
		makeDistinct: aBoolean.
	aMagmaCollection changes reset.
	changes additionsDo: 
		[ : eachObject : eachHash | 
		(aMagmaCollectionReader expression evaluate: eachObject) ifTrue: [ aMagmaCollection add: eachObject ] ].
	changes removedDo: 
		[ : eachObject : eachHash | 
		(aMagmaCollectionReader expression evaluate: eachObject) ifTrue: [ aMagmaCollection remove: eachObject ] ]