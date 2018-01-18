private
startingPositionFor: aString 
	self isLeftAligned ifTrue: [ ^ 1 ].
	self isRightAligned ifTrue: [ ^ self width - aString size + 1 ].
	^ self width - (aString size // 2)