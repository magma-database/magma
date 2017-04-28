private
addChangesFromReadSet
	readSet keysAndValuesDo:
		[ : eachCurrent : eachBuffer | | didChange | 
		eachCurrent ifNotNil:
			[ didChange := self
				didChange: eachCurrent
				from: eachBuffer.
			didChange ifTrue: [ commitPackage addObject: eachCurrent ] ] ]