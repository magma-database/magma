private actions
addKeys: anArray

	^anArray collect: [ :each | self addKey: each ]
