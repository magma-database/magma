accessing
thisPlayer
	"Answer the player matching my image filename."
	^ self playerLinks 
		detect: 
			[ : each | 
			(each imageFilename , '.image') = (FileDirectory localNameFor: SmalltalkImage current imageName) and: [ self = each testCaseClass or: [ "Magma tests always use a MagmaCollectionTester, needs this" self inheritsFrom: each testCaseClass ] ] ]
		ifNone: [ nil ]